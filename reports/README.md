# Reports Compatibility Shim

`reports/` is now a compatibility path. Canonical run artifacts live under `runs/`.

## Canonical Paths
- `runs/runtime/`
- `runs/examples/`
- `runs/qa/`
- `runs/archive/`

## Notes
- Existing workflows that still read/write `reports/...` continue to work through symlinks.
- New workflows should use `runs/...` paths directly.
