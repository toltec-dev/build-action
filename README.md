# build-action
Build a toltec package recipe with toltecmk.

# Usage
See [action.yml](action.yml) for the possible inputs.

*Note*: Currently this only supports ubuntu-20.04

## Package Recipe
```bash
pkgname=my-package
pkgdesc="An example package"
url=https://example.com
pkgver=0.0.1-1
timestamp=2020-10-09T18:15Z
section=util
maintainer="My Name <me@example.com>"
license=MIT

image=toolchain:v3.1
source=(src.tar.gz)
sha256sums=(SKIP)

package() {
    install -D -m 755 -t "$pkgdir"/opt/bin \
      "$srcdir"/my-program
}
```

## Workflow
```yaml
jobs:
  build:
    name: Build package
    runs-on: ubuntu-20.04
    steps:
      - name: Checkout the Git repository
        uses: actions/checkout@v4
      - name: Create source tarball
        run: tar -czvf src.tar.gz src
      - name: Build package
        uses: toltec-dev/build-action@v1
      - name: Save packages
        uses: actions/upload-artifact@v3
        with:
          name: packages
          path: dist/**/*.ipk

```
