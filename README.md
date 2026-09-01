# Homebrew tools

Homebrew tap for Celeris command-line tools and desktop apps.

```sh
brew install ai-celeris/tools/celeris
brew install --cask ai-celeris/tools/celeris-dash
```

Dash preview channels use `celeris-dash@beta` and
`celeris-dash@nightly`. Release automation maintains all casks in `Casks/`.

Casks are macOS-only. On Linux, Dash installs from the formulae in `Formula/`,
which ship the published AppImage:

```sh
brew install ai-celeris/tools/celeris-dash          # stable
brew install ai-celeris/tools/celeris-dash-beta     # beta
brew install ai-celeris/tools/celeris-dash-nightly  # nightly
```

They use `-beta`/`-nightly` rather than the casks' `@` spelling because
Homebrew only maps `@` into a formula class name when a digit follows it.
