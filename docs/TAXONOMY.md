# Taxonomy Guide

The canonical tag registry is `catalog/taxonomy.yaml`.

## Purpose
- Keep tags consistent as the literature catalog grows.
- Improve retrieval and routing for tools, skills, and agents.
- Prevent tag drift (`DiD`, `did`, `difference_in_differences` style duplication).

## Domains
- `method_family`: econometric design and estimator families.
- `inference`: inference and uncertainty procedures.
- `data_structure`: structure of observational units and panel/network form.
- `domain_application`: substantive application domain.
- `lifecycle`: maturity/status tags.

## Rules
- Tags must be `snake_case`.
- New tags should be added to `catalog/taxonomy.yaml` before use in `catalog/literature_catalog.yaml`.
- Every catalog entry should include:
  - `family_tags` from `method_family`
  - `inference_tags` from `inference` (can be empty)
  - `domain_tags` from `domain_application`
- Prefer 1-3 `method_family` tags per entry, then add inference/domain tags as needed.

## Validation
- `platform/scripts/validate_literature_catalog.sh` checks `family_tags`, `inference_tags`, and `domain_tags` against taxonomy domains.
- `platform/scripts/register_literature_entry.sh --strict-tags` blocks unknown tags at registration time.
- `platform/scripts/list_taxonomy_tags.sh` prints available tags grouped by domain.
