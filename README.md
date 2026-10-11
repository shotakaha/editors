# editors

My editors configurations.

This repository stores the configuration files for the editors I use, such as VS Code, Emacs, Vim and Zed.

## Documentation

Usage documentation lives in [docs/](docs/) and is built with [Zensical](https://zensical.org/).
The site is configured in [zensical.toml](zensical.toml).

| Section | Contents |
| --- | --- |
| [Installation](docs/installation/index.md) | How to set up the configurations |
| [User guide](docs/user-guide/index.md) | How to use the configurations |
| [Developer guide](docs/developer-guide/index.md) | How the configurations are organized |
| [Contributor guide](docs/contributor-guide/index.md) | How to contribute |
| [Maintainer guide](docs/maintainer-guide/index.md) | How to maintain and release |
| [Releases](docs/releases/index.md) | Release notes |

### Preview and build

The documentation dependencies are managed with [uv](https://docs.astral.sh/uv/).

```sh
uv sync --group docs
uv run zensical serve   # preview locally
uv run zensical build   # build the site
```

## License

See [LICENSE](LICENSE).
