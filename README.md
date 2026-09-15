# Homebrew tools

Homebrew tap for Celeris command-line tools and desktop apps.

```sh
brew install --cask ai-celeris/tools/celeris       # desktop app (stable)
brew install ai-celeris/tools/celeris-cli          # command-line interface
```

Celeris preview channels use `celeris@beta` and `celeris@nightly`. Release
automation maintains all casks in `Casks/`.

```sh
brew install --cask ai-celeris/tools/celeris@beta
brew install --cask ai-celeris/tools/celeris@nightly
```

Casks are macOS-only. On Linux, the Celeris app installs from the formulae in
`Formula/`, which ship the published AppImage:

```sh
brew install ai-celeris/tools/celeris          # stable
brew install ai-celeris/tools/celeris-beta     # beta
brew install ai-celeris/tools/celeris-nightly  # nightly
```

They use `-beta`/`-nightly` rather than the casks' `@` spelling because
Homebrew only maps `@` into a formula class name when a digit follows it.
