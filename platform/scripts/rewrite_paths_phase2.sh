#!/usr/bin/env bash
set -euo pipefail

FILES=(README.md TEAM_DEPLOYMENT_GUIDE.md)

while IFS= read -r f; do FILES+=("$f"); done < <(find docs catalog platform .github runs reports -type f \( -name '*.md' -o -name '*.yaml' -o -name '*.yml' -o -name '*.sh' \) | sort)

for f in "${FILES[@]}"; do
  if [[ "$f" == "platform/scripts/rewrite_paths_phase2.sh" ]]; then
    continue
  fi
  perl -0pi -e '
    s{(?<!platform/)agents/}{platform/agents/}g;
    s{(?<!platform/)skills/}{platform/skills/}g;
    s{(?<!platform/)templates/}{platform/templates/}g;
    s{(?<!platform/)scripts/}{platform/scripts/}g;
    s{\bAI_READABLE/}{literature/canonical_ai_readable/}g;
    s{\breports/runtime/}{runs/runtime/}g;
    s{\breports/examples/}{runs/examples/}g;
    s{\breports/qa/}{runs/qa/}g;
    s{\breports/archive/}{runs/archive/}g;
  ' "$f"
done

echo "Rewrote canonical paths in ${#FILES[@]} files."
