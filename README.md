## Dynamic Web TWAIN Documentation

This project is to store [Dynamic Web TWAIN](https://www.dynamsoft.com/web-twain/overview/)'s documentation. The main official documentation website is hosted at <https://www.dynamsoft.com/web-twain/docs/introduction/index.html>.

### Local Development

1. Prerequisites:
   - `git`
   - `bundle` (install Ruby + Bundler)
   - `robocopy` (Windows built-in command used by the script)
   - Note: a global Jekyll install is not required because the script runs `bundle exec jekyll`.
2. Run the local dev script from this repository root:

   ```powershell
   powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1
   ```

This script keeps all local-only files in `.dev/`:
- `.dev/Docs-Template-Repo` (template clone)
- `.dev/DocHome` (merged docs + template workspace)
- `.dev/vendor/bundle`, `.dev/.bundle`, `.dev/.bundle-user`, `.dev/.jekyll-cache`, `.dev/_site`

Optional flags:

```powershell
# Prepare workspace only (do not start server)
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1 -NoServe

# Skip template pull/refresh and use current local template copy
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1 -NoTemplateUpdate

# Change port
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1 -Port 6001

# Bind to all interfaces (optional)
powershell -ExecutionPolicy Bypass -File .\scripts\dev.ps1 -BindHost 0.0.0.0
```

Local preview URL root:

```text
http://localhost:5555/web-twain/docs/
```

### License

All documentation is available under the terms of [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).
