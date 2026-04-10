# Development Scripts

This folder contains local development setup scripts for this repository:

- `dev.ps1`: Windows PowerShell workflow
- `dev.sh`: Linux/WSL Bash workflow

Both scripts do the same high-level flow:

1. Prepare a local `.dev/` workspace in this repo.
2. Clone or sync `Docs-Template-Repo` into `.dev/Docs-Template-Repo`.
3. Build a merged workspace in `.dev/DocHome` (docs + template).
4. Replace `assetsPath` values in `_includes` and `_layouts`.
5. Install gems with Bundler using local cache directories under `.dev/`.
6. Run `jekyll serve` (or print the serve command when no-serve mode is used).

## Windows (`dev.ps1`)

Run from repo root:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1
```

Useful options:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1 -NoServe
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1 -NoTemplateUpdate
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1 -Port 6001
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1 -BindHost 0.0.0.0
```

## Linux / WSL (`dev.sh`)

Run from repo root:

```bash
bash ./scripts/dev.sh
```

Useful options:

```bash
bash ./scripts/dev.sh --no-serve
bash ./scripts/dev.sh --no-template-update
bash ./scripts/dev.sh --port 6001
bash ./scripts/dev.sh --bind-host 0.0.0.0
```

## Output

Default local URL root after start:

```text
http://localhost:5555/web-twain/docs/
```
