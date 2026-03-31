## Dynamic Web TWAIN Documentation

This project is to store [Dynamic Web TWAIN](https://www.dynamsoft.com/web-twain/overview/)'s documentation. The main official documentation website is hosted at <https://www.dynamsoft.com/web-twain/docs/introduction/index.html>.

### Local Development

1. Download the docs template repo and the Web TWAIN docs repo with [download-dwt.sh](https://github.com/tony-xlh/misc/raw/refs/heads/main/build-docs/download-dwt.sh).
2. Install Ruby.
3. Go to the docs' folder and install dependencies.

   ```bash
   bundle install
   ```

4. Serve the site.

   ```bash
   bundle exec jekyll serve -P 5555 --trace --host=0.0.0.0
   ```

The recommended environment is Linux — for Windows users, WSL is recommended.

### License

All documentation is available under the terms of [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/).


