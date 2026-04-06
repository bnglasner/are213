#!/usr/bin/env python3
"""Cleanup pass for MarkItDown outputs on slide-heavy PDFs.

Transforms:
1) Flatten markdown pipe-table blocks into plain text lines.
2) Replace common PDF glyph artifacts like (cid:0), (cid:1), ...
3) Remove isolated slide-number lines and normalize whitespace.
"""

from __future__ import annotations

import argparse
import re
from pathlib import Path


CID_MAP = {
    "(cid:0)": "-",
    "(cid:1)": "*",
    "(cid:2)": "[",
    "(cid:3)": "]",
    "(cid:16)": "(",
    "(cid:17)": ")",
    "(cid:18)": "<",
    "(cid:19)": ">",
    "(cid:20)": "<=",
    "(cid:21)": ">=",
    "(cid:24)": "~",
    "(cid:28)": "<<",
}


def is_table_line(line: str) -> bool:
    s = line.strip()
    return s.startswith("|") and s.endswith("|")


def parse_table_row(line: str) -> list[str]:
    parts = [p.strip() for p in line.strip().split("|")[1:-1]]
    return parts


def is_separator_row(cells: list[str]) -> bool:
    if not cells:
        return False
    non_empty = [c for c in cells if c]
    if not non_empty:
        return True
    return all(re.fullmatch(r":?-{2,}:?", c) is not None for c in non_empty)


def flatten_table_block(block: list[str]) -> list[str]:
    out: list[str] = []
    for line in block:
        cells = parse_table_row(line)
        if is_separator_row(cells):
            continue
        tokens = [c for c in cells if c]
        if not tokens:
            continue
        text = " ".join(tokens)
        text = re.sub(r"\s+", " ", text).strip()
        if text:
            out.append(text)
    return out


def flatten_all_tables(text: str) -> str:
    lines = text.splitlines()
    out: list[str] = []
    i = 0
    while i < len(lines):
        if is_table_line(lines[i]):
            j = i
            block: list[str] = []
            while j < len(lines) and is_table_line(lines[j]):
                block.append(lines[j])
                j += 1
            out.extend(flatten_table_block(block))
            i = j
        else:
            out.append(lines[i])
            i += 1
    return "\n".join(out)


def replace_cid_tokens(text: str) -> str:
    for src, dst in CID_MAP.items():
        text = text.replace(src, dst)
    # For any remaining unmapped CID tokens, drop token but keep spacing.
    text = re.sub(r"\(cid:\d+\)", " ", text)
    return text


def remove_isolated_slide_numbers(lines: list[str]) -> list[str]:
    out: list[str] = []
    n = len(lines)
    for i, line in enumerate(lines):
        s = line.strip()
        if re.fullmatch(r"\d{1,3}", s):
            prev_blank = i == 0 or not lines[i - 1].strip()
            next_blank = i == n - 1 or not lines[i + 1].strip()
            # Typical slide-number footprint: short integer with whitespace separation.
            if prev_blank or next_blank:
                continue
        out.append(line)
    return out


def normalize_lines(text: str) -> str:
    lines = text.splitlines()
    lines = remove_isolated_slide_numbers(lines)

    # Collapse repeated whitespace and de-duplicate consecutive duplicate lines.
    norm: list[str] = []
    last = None
    for line in lines:
        clean = re.sub(r"[ \t]+", " ", line).rstrip()
        if clean == last and clean.strip():
            continue
        norm.append(clean)
        last = clean

    # Collapse 3+ blank lines to max 2.
    text2 = "\n".join(norm)
    text2 = re.sub(r"\n{3,}", "\n\n", text2).strip() + "\n"
    return text2


def cleanup_text(text: str) -> str:
    text = flatten_all_tables(text)
    text = replace_cid_tokens(text)
    text = normalize_lines(text)
    return text


def run(input_dir: Path, output_dir: Path) -> tuple[int, int]:
    output_dir.mkdir(parents=True, exist_ok=True)
    files = sorted(input_dir.glob("*.md"))
    converted = 0

    for path in files:
        src = path.read_text(encoding="utf-8", errors="ignore")
        dst_text = cleanup_text(src)
        (output_dir / path.name).write_text(dst_text, encoding="utf-8")
        converted += 1

    return converted, len(files)


def main() -> None:
    parser = argparse.ArgumentParser(description="Cleanup MarkItDown markdown output.")
    parser.add_argument("--input-dir", required=True, type=Path)
    parser.add_argument("--output-dir", required=True, type=Path)
    args = parser.parse_args()

    converted, total = run(args.input_dir, args.output_dir)
    print(f"Cleaned {converted}/{total} markdown files.")


if __name__ == "__main__":
    main()
