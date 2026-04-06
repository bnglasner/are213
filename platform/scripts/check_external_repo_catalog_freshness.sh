#!/usr/bin/env bash
set -euo pipefail

CATALOG="catalog/external_repo_catalog.yaml"
THRESHOLD_DAYS="${FRESHNESS_DAYS:-90}"

if [[ ! -f "$CATALOG" ]]; then
  echo "[FAIL] Missing catalog: $CATALOG"
  exit 1
fi

UPDATED_ON="$(rg --no-filename '^updated_on: ' "$CATALOG" | sed 's/^updated_on: //')"
if [[ -z "$UPDATED_ON" ]]; then
  echo "[FAIL] updated_on is missing in $CATALOG"
  exit 1
fi

if ! [[ "$THRESHOLD_DAYS" =~ ^[0-9]+$ ]]; then
  echo "[FAIL] FRESHNESS_DAYS must be an integer. Got: $THRESHOLD_DAYS"
  exit 1
fi

ruby -e '
require "date"

updated_on = ARGV[0]
threshold = ARGV[1].to_i

begin
  updated_date = Date.parse(updated_on)
rescue StandardError
  puts "[FAIL] updated_on is not parseable as a date: #{updated_on.inspect}"
  exit 1
end

today = Date.today
age_days = (today - updated_date).to_i

if age_days <= threshold
  puts "[PASS] external repo catalog freshness is within threshold: age=#{age_days} days, threshold=#{threshold} days."
  exit 0
end

puts "[FAIL] external repo catalog is stale: age=#{age_days} days exceeds threshold=#{threshold} days."
exit 1
' "$UPDATED_ON" "$THRESHOLD_DAYS"
