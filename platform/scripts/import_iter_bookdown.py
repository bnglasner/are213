#!/usr/bin/env python3
"""Automated importer for Introduction to Econometrics with R (ITER).

Comprehensive workflow:
1) Fetch index and parse the full TOC (preface, chapter, subsection levels).
2) For each top-level chapter, crawl all subsection pages listed in the TOC.
3) Snapshot each component HTML page into literature/derived/<book_slug>/html/.
4) Build one comprehensive per-chapter markdown file in
   literature/canonical_ai_readable/external/<book_slug>/.
5) Create one-page PDF provenance receipts in literature/raw_pdf/inbox/<book_slug>/.
6) Optionally register entries in catalog/literature_catalog.yaml.
"""

from __future__ import annotations

import argparse
import datetime as dt
import html
import re
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path
from urllib.parse import urljoin
from urllib.request import Request, urlopen


DEFAULT_INDEX_URL = "https://bookdown.org/machar1991/ITER/index.html"
USER_AGENT = "are213-importer/1.0 (+https://bookdown.org/machar1991/ITER/)"


CHAPTER_TAG_MAP: dict[int, tuple[list[str], list[str]]] = {
    1: (["general"], []),
    2: (["general"], []),
    3: (["general"], []),
    4: (["regression"], []),
    5: (["regression"], ["cluster_robust"]),
    6: (["regression"], []),
    7: (["regression"], ["cluster_robust"]),
    8: (["nonlinear"], []),
    9: (["regression"], []),
    10: (["panel_fe"], ["cluster_robust"]),
    11: (["nonlinear"], []),
    12: (["iv"], ["weak_iv_robust"]),
    13: (["causality", "rct"], ["randomization_inference"]),
    14: (["time_series", "forecasting"], []),
    15: (["time_series", "causality"], ["spatial_hac"]),
    16: (["time_series", "forecasting"], ["spatial_hac"]),
}


TOC_PATTERN = re.compile(
    r'<li class="chapter" data-level="([^"]*)" data-path="([^"]+)"><a href="([^"]*)">.*?(?:<b>[^<]*</b>\s*)?(.+?)</a>',
    flags=re.S,
)

NOISE_LINE_PATTERNS = [
    re.compile(r"^This book is in Open Review", re.I),
    re.compile(r"^You may annotate some text", re.I),
    re.compile(r"^You can also see the annotations", re.I),
]


@dataclass(frozen=True)
class TocRow:
    level: str
    path: str
    href: str
    title: str


@dataclass
class SourcePart:
    level: str
    title: str
    relative_path: str
    source_url: str
    html_snapshot: Path


@dataclass
class ImportItem:
    entry_id: str
    level: str
    title: str
    relative_path: str
    source_url: str
    stem: str
    family_tags: list[str]
    inference_tags: list[str]
    domain_tags: list[str]
    html_snapshot: Path
    canonical_md: Path
    source_pdf: Path
    parts: list[SourcePart]


def fetch_text(url: str) -> str:
    req = Request(url, headers={"User-Agent": USER_AGENT})
    with urlopen(req, timeout=60) as resp:
        raw = resp.read()
        charset = resp.headers.get_content_charset() or "utf-8"
    return raw.decode(charset, errors="replace")


def strip_tags(fragment: str) -> str:
    text = re.sub(r"(?is)<[^>]+>", " ", fragment)
    text = html.unescape(text)
    text = re.sub(r"\s+", " ", text).strip()
    return text


def slugify(text: str, max_len: int = 40) -> str:
    text = strip_tags(text).lower()
    text = re.sub(r"[^a-z0-9]+", "_", text).strip("_")
    if not text:
        return "untitled"
    if len(text) > max_len:
        text = text[:max_len].rstrip("_")
    return text


def normalize_toc_title(raw_title: str) -> str:
    title = strip_tags(raw_title)
    title = re.sub(r"^[0-9]+(?:\.[0-9]+)?\s+", "", title).strip()
    return title


def parse_toc_rows(index_html: str) -> list[TocRow]:
    rows: list[TocRow] = []
    for level, data_path, href, raw_title in TOC_PATTERN.findall(index_html):
        title = normalize_toc_title(raw_title)
        if not title:
            continue
        rows.append(TocRow(level=level, path=data_path, href=href, title=title))
    return rows


def select_top_level_rows(rows: list[TocRow], include_preface: bool) -> list[TocRow]:
    top: list[TocRow] = []

    if include_preface:
        for row in rows:
            if row.level == "" and row.path == "index.html" and row.title.lower() == "preface":
                top.append(TocRow(level="preface", path=row.path, href=row.href, title=row.title))
                break

    chapters = [row for row in rows if re.fullmatch(r"[0-9]+", row.level)]
    chapters.sort(key=lambda r: int(r.level))
    top.extend(chapters)
    return top


def classify(level: str) -> tuple[list[str], list[str], list[str]]:
    if level == "preface":
        return ["general"], [], ["methodology"]
    chapter_num = int(level)
    family, inference = CHAPTER_TAG_MAP.get(chapter_num, (["general"], []))
    return family, inference, ["methodology"]


def unique_rows_by_path(rows: list[TocRow]) -> list[TocRow]:
    out: list[TocRow] = []
    seen: set[str] = set()
    for row in rows:
        if row.path in seen:
            continue
        out.append(row)
        seen.add(row.path)
    return out


def chapter_component_rows(top_row: TocRow, all_rows: list[TocRow]) -> list[TocRow]:
    if top_row.level == "preface":
        return [TocRow(level="preface", path=top_row.path, href=top_row.href, title=top_row.title)]

    level_prefix = f"{top_row.level}."
    rows = [top_row]
    rows.extend(row for row in all_rows if row.level.startswith(level_prefix))
    return unique_rows_by_path(rows)


def extract_main_section(page_html: str) -> str:
    m = re.search(r'(?is)<section class="normal"[^>]*>(.*?)</section>', page_html)
    if m:
        return m.group(1)
    m = re.search(r"(?is)<body[^>]*>(.*?)</body>", page_html)
    if m:
        return m.group(1)
    return page_html


def html_code_to_text(raw: str) -> str:
    text = re.sub(r"(?is)<span[^>]*>", "", raw)
    text = re.sub(r"(?is)</span>", "", text)
    text = re.sub(r"(?is)<code[^>]*>", "", text)
    text = re.sub(r"(?is)</code>", "", text)
    text = re.sub(r"(?i)<br\s*/?>", "\n", text)
    text = re.sub(r"(?is)<[^>]+>", "", text)
    text = html.unescape(text)
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    return text.strip("\n")


def html_fragment_to_markdown(fragment: str) -> str:
    text = fragment
    text = re.sub(r"(?is)<script[^>]*>.*?</script>", "", text)
    text = re.sub(r"(?is)<style[^>]*>.*?</style>", "", text)
    text = re.sub(r"(?is)<div class\s*=\s*[\"\']rmdreview[\"\'][^>]*>.*?</div>", "", text)

    text = re.sub(
        r"(?is)<pre[^>]*>(.*?)</pre>",
        lambda m: f"\n```r\n{html_code_to_text(m.group(1))}\n```\n\n",
        text,
    )

    def heading_repl(level: str, marker: str, s: str) -> str:
        return re.sub(
            rf"(?is)<h{level}[^>]*>(.*?)</h{level}>",
            lambda m: f"\n{marker} {strip_tags(m.group(1))}\n\n",
            s,
        )

    text = heading_repl("1", "#", text)
    text = heading_repl("2", "##", text)
    text = heading_repl("3", "###", text)
    text = heading_repl("4", "####", text)

    text = re.sub(r"(?is)<li[^>]*>(.*?)</li>", lambda m: f"- {strip_tags(m.group(1))}\n", text)
    text = re.sub(r"(?is)<p[^>]*>(.*?)</p>", lambda m: f"{strip_tags(m.group(1))}\n\n", text)
    text = re.sub(r"(?i)<br\s*/?>", "\n", text)
    text = re.sub(r"(?is)<[^>]+>", " ", text)
    text = html.unescape(text)
    text = re.sub(r"[ \t]+", " ", text)
    text = re.sub(r"\n[ \t]+", "\n", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip() + "\n"


def strip_heading_prefix(line: str) -> str:
    return re.sub(r"^#+\s*", "", line.strip()).strip().lower()


def remove_duplicate_leading_headings(markdown: str, item: ImportItem, part: SourcePart) -> str:
    lines = markdown.splitlines()
    while lines and not lines[0].strip():
        lines.pop(0)
    item_variants = {
        item.title.lower(),
        part.title.lower(),
    }
    if item.level != "preface":
        item_variants.add(f"{item.level} {item.title}".lower())
        if part.level not in ("", "preface"):
            item_variants.add(f"{part.level} {part.title}".lower())

    while lines and lines[0].lstrip().startswith("#"):
        normalized = strip_heading_prefix(lines[0])
        if (
            normalized in item_variants
            or part.title.lower() in normalized
            or item.title.lower() in normalized
        ):
            lines.pop(0)
            while lines and not lines[0].strip():
                lines.pop(0)
        else:
            break
    return "\n".join(lines).strip() + "\n"


def clean_markdown_noise(markdown: str) -> str:
    out: list[str] = []
    for line in markdown.splitlines():
        s = line.strip()
        if not s:
            out.append("")
            continue
        if any(p.search(s) for p in NOISE_LINE_PATTERNS):
            continue
        if s == "":
            continue
        out.append(line)

    text = "\n".join(out)
    text = re.sub(r"\n{3,}", "\n\n", text).strip() + "\n"
    return text


def part_heading(part: SourcePart) -> str:
    if part.level == "preface":
        return "Preface"
    if re.fullmatch(r"[0-9]+(?:\.[0-9]+)?", part.level):
        return f"{part.level} {part.title}"
    return part.title


def make_part_markdown(item: ImportItem, part: SourcePart, page_html: str) -> str:
    section = extract_main_section(page_html)
    body = html_fragment_to_markdown(section)
    body = clean_markdown_noise(body)
    body = remove_duplicate_leading_headings(body, item, part)
    return f"## {part_heading(part)}\n\n{body}"


def make_comprehensive_markdown(item: ImportItem, fetched_on: str, parts_md: list[str]) -> str:
    lines: list[str] = []
    lines.append(f"# {item.title}")
    lines.append("")
    lines.append(f"- Primary Source URL: {item.source_url}")
    lines.append(f"- Imported on: {fetched_on}")
    lines.append(f"- Component pages: {len(item.parts)}")
    lines.append("")
    lines.append("## Source Components")
    lines.append("")

    for idx, part in enumerate(item.parts, start=1):
        label = part_heading(part)
        lines.append(f"{idx}. `{label}` - {part.source_url}")

    lines.append("")
    lines.append("## Compiled Content")
    lines.append("")
    lines.append("\n\n".join(parts_md).strip())
    lines.append("")

    text = "\n".join(lines)
    text = re.sub(r"\n{3,}", "\n\n", text).strip() + "\n"
    return text


def pdf_escape(value: str) -> str:
    return value.replace("\\", "\\\\").replace("(", "\\(").replace(")", "\\)")


def build_one_page_pdf(lines: list[str]) -> bytes:
    y = 760
    commands: list[str] = []
    first = True
    for line in lines:
        clean = line.strip()
        if not clean:
            y -= 14
            continue
        size = 12 if first else 10
        first = False
        commands.append(f"BT /F1 {size} Tf 72 {y} Td ({pdf_escape(clean[:105])}) Tj ET")
        y -= 14
        if y < 72:
            break
    stream = ("\n".join(commands) + "\n").encode("latin-1", errors="replace")

    objects: list[bytes] = [
        b"<< /Type /Catalog /Pages 2 0 R >>",
        b"<< /Type /Pages /Kids [3 0 R] /Count 1 >>",
        b"<< /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Resources << /Font << /F1 4 0 R >> >> /Contents 5 0 R >>",
        b"<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>",
        b"<< /Length " + str(len(stream)).encode("ascii") + b" >>\nstream\n" + stream + b"endstream",
    ]

    out = b"%PDF-1.4\n%\xe2\xe3\xcf\xd3\n"
    offsets = [0]
    for idx, obj in enumerate(objects, start=1):
        offsets.append(len(out))
        out += f"{idx} 0 obj\n".encode("ascii") + obj + b"\nendobj\n"

    xref_offset = len(out)
    out += f"xref\n0 {len(objects) + 1}\n".encode("ascii")
    out += b"0000000000 65535 f \n"
    for off in offsets[1:]:
        out += f"{off:010d} 00000 n \n".encode("ascii")
    out += (
        f"trailer\n<< /Size {len(objects) + 1} /Root 1 0 R >>\nstartxref\n{xref_offset}\n%%EOF\n".encode("ascii")
    )
    return out


def write_pdf_receipt(path: Path, item: ImportItem, fetched_on: str) -> None:
    lines = [
        f"ITER Source Receipt: {item.title}",
        f"Entry id: {item.entry_id}",
        f"TOC level: {item.level}",
        f"Primary source URL: {item.source_url}",
        f"Component pages: {len(item.parts)}",
        f"Imported on: {fetched_on}",
        "Note: This PDF is a provenance receipt for the imported web chapter compilation.",
    ]
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(build_one_page_pdf(lines))


def read_catalog_ids(catalog_path: Path) -> set[str]:
    if not catalog_path.exists():
        return set()
    text = catalog_path.read_text(encoding="utf-8", errors="ignore")
    return set(re.findall(r"(?m)^  - id: ([a-z0-9_]+)$", text))


def run_register(item: ImportItem, taxonomy: Path, strict_tags: bool) -> None:
    cmd = [
        "platform/scripts/register_literature_entry.sh",
        "--id",
        item.entry_id,
        "--title",
        item.title,
        "--source-pdf",
        item.source_pdf.as_posix(),
        "--canonical-md",
        item.canonical_md.as_posix(),
        "--tags",
        ",".join(item.family_tags),
        "--inference-tags",
        ",".join(item.inference_tags),
        "--domain-tags",
        ",".join(item.domain_tags),
        "--taxonomy",
        taxonomy.as_posix(),
    ]
    if strict_tags:
        cmd.append("--strict-tags")
    subprocess.run(cmd, check=True)


def yaml_quote(value: str) -> str:
    escaped = value.replace("\\", "\\\\").replace('"', '\\"')
    return f'"{escaped}"'


def write_manifest(path: Path, items: list[ImportItem], generated_on: str, index_url: str) -> None:
    lines: list[str] = []
    lines.append("version: 1")
    lines.append(f"generated_on: {generated_on}")
    lines.append(f"source_index: {yaml_quote(index_url)}")
    lines.append("entries:")

    for item in items:
        lines.append(f"  - id: {item.entry_id}")
        lines.append(f"    level: {yaml_quote(item.level)}")
        lines.append(f"    title: {yaml_quote(item.title)}")
        lines.append(f"    relative_path: {yaml_quote(item.relative_path)}")
        lines.append(f"    source_url: {yaml_quote(item.source_url)}")
        lines.append(f"    html_snapshot: {item.html_snapshot.as_posix()}")
        lines.append(f"    canonical_markdown: {item.canonical_md.as_posix()}")
        lines.append(f"    source_pdf: {item.source_pdf.as_posix()}")
        lines.append(f"    family_tags: [{', '.join(item.family_tags)}]")
        lines.append(f"    inference_tags: [{', '.join(item.inference_tags)}]")
        lines.append(f"    domain_tags: [{', '.join(item.domain_tags)}]")
        lines.append("    components:")
        for part in item.parts:
            lines.append(f"      - level: {yaml_quote(part.level)}")
            lines.append(f"        title: {yaml_quote(part.title)}")
            lines.append(f"        relative_path: {yaml_quote(part.relative_path)}")
            lines.append(f"        source_url: {yaml_quote(part.source_url)}")
            lines.append(f"        html_snapshot: {part.html_snapshot.as_posix()}")

    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def component_snapshot_path(book_slug: str, stem: str, idx: int, part: TocRow) -> Path:
    level_token = part.level if part.level else "section"
    level_token = re.sub(r"[^a-zA-Z0-9_.-]+", "_", level_token)
    title_token = slugify(part.title, max_len=24)
    filename = f"{stem}__{idx:02d}_{level_token}_{title_token}.html"
    return Path("literature/derived") / book_slug / "html" / filename


def build_items(index_url: str, top_rows: list[TocRow], all_rows: list[TocRow], book_slug: str) -> list[ImportItem]:
    items: list[ImportItem] = []

    for top_row in top_rows:
        if top_row.level == "preface":
            stem = f"{book_slug}_preface"
            entry_id = stem
        else:
            chapter_num = int(top_row.level)
            stem = f"{book_slug}_ch{chapter_num:02d}_{slugify(top_row.title)}"
            entry_id = stem

        component_rows = chapter_component_rows(top_row, all_rows)
        parts: list[SourcePart] = []
        for idx, row in enumerate(component_rows, start=1):
            part_level = row.level if row.level else "section"
            part_url = urljoin(index_url, row.path)
            parts.append(
                SourcePart(
                    level=part_level,
                    title=row.title,
                    relative_path=row.path,
                    source_url=part_url,
                    html_snapshot=component_snapshot_path(book_slug, stem, idx, row),
                )
            )

        family_tags, inference_tags, domain_tags = classify(top_row.level)

        item = ImportItem(
            entry_id=entry_id,
            level=top_row.level,
            title=top_row.title,
            relative_path=top_row.path,
            source_url=urljoin(index_url, top_row.path),
            stem=stem,
            family_tags=family_tags,
            inference_tags=inference_tags,
            domain_tags=domain_tags,
            html_snapshot=parts[0].html_snapshot,
            canonical_md=Path("literature/canonical_ai_readable/external") / book_slug / f"{stem}.md",
            source_pdf=Path("literature/raw_pdf/inbox") / book_slug / f"{stem}.pdf",
            parts=parts,
        )
        items.append(item)

    return items


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Import ITER chapters into are213 canonical structure.")
    parser.add_argument("--index-url", default=DEFAULT_INDEX_URL)
    parser.add_argument("--book-slug", default="iter")
    parser.add_argument("--catalog", default="catalog/literature_catalog.yaml")
    parser.add_argument("--taxonomy", default="catalog/taxonomy.yaml")
    parser.add_argument("--limit", type=int, default=0, help="Limit number of top-level items (0 means all).")
    parser.add_argument("--skip-preface", action="store_true")
    parser.add_argument("--no-register", action="store_true", help="Fetch/write files but do not edit catalog.")
    parser.add_argument("--no-strict-tags", action="store_true")
    parser.add_argument("--overwrite", action="store_true")
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    generated_on = dt.date.today().isoformat()

    index_html = fetch_text(args.index_url)
    all_rows = parse_toc_rows(index_html)
    top_rows = select_top_level_rows(all_rows, include_preface=not args.skip_preface)

    if args.limit > 0:
        top_rows = top_rows[: args.limit]

    if not top_rows:
        print("No importable TOC entries found.", file=sys.stderr)
        return 1

    items = build_items(args.index_url, top_rows, all_rows, args.book_slug)

    manifest_path = Path("literature/derived") / args.book_slug / "manifest.yaml"
    if args.dry_run:
        print(f"[DRY-RUN] Would write manifest: {manifest_path.as_posix()}")
    else:
        write_manifest(manifest_path, items, generated_on, args.index_url)
        print(f"Wrote manifest: {manifest_path.as_posix()}")

    existing_ids = read_catalog_ids(Path(args.catalog))
    strict_tags = not args.no_strict_tags
    register_enabled = not args.no_register

    processed = 0
    skipped_existing = 0
    registered = 0

    for item in items:
        part_markdowns: list[str] = []

        for part in item.parts:
            page_html = fetch_text(part.source_url)
            part_md = make_part_markdown(item, part, page_html)
            part_markdowns.append(part_md)

            if args.dry_run:
                print(f"[DRY-RUN] Would write: {part.html_snapshot.as_posix()}")
            else:
                part.html_snapshot.parent.mkdir(parents=True, exist_ok=True)
                if args.overwrite or not part.html_snapshot.exists():
                    part.html_snapshot.write_text(page_html, encoding="utf-8")

        compiled_md = make_comprehensive_markdown(item, generated_on, part_markdowns)

        if args.dry_run:
            print(f"[DRY-RUN] Would write: {item.canonical_md.as_posix()}")
            print(f"[DRY-RUN] Would write: {item.source_pdf.as_posix()}")
        else:
            item.canonical_md.parent.mkdir(parents=True, exist_ok=True)
            item.source_pdf.parent.mkdir(parents=True, exist_ok=True)
            if args.overwrite or not item.canonical_md.exists():
                item.canonical_md.write_text(compiled_md, encoding="utf-8")
            if args.overwrite or not item.source_pdf.exists():
                write_pdf_receipt(item.source_pdf, item, generated_on)

        processed += 1

        if not register_enabled:
            continue
        if item.entry_id in existing_ids:
            print(f"Skip existing catalog id: {item.entry_id}")
            skipped_existing += 1
            continue
        if args.dry_run:
            print(
                "[DRY-RUN] Would register "
                f"{item.entry_id} tags={item.family_tags} inference={item.inference_tags} domain={item.domain_tags}"
            )
            continue

        run_register(item, Path(args.taxonomy), strict_tags=strict_tags)
        existing_ids.add(item.entry_id)
        registered += 1
        print(f"Registered: {item.entry_id}")

    print(
        f"Done. processed={processed} registered={registered} "
        f"skipped_existing_catalog={skipped_existing} register_enabled={register_enabled}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
