# editors

My editors configurations.

This repository stores the configuration files for the editors I use, such as VS Code, Emacs, Vim and Zed.

## Editors

| Editor | Configuration | Status |
| --- | --- | --- |
| Vim | [vim/vimrc](vim/vimrc) | Available |
| VS Code, Emacs, Zed, ... | | Planned |

### Vim

The Vim configuration uses [vim-plug](https://github.com/junegunn/vim-plug) for plugins and Emacs-like keybinds.
Installation steps are written at the top of [vim/vimrc](vim/vimrc).

```sh
# 1. Backup the current vimrc (skip if it does not exist)
cp ~/.vimrc ~/.vimrc.bak

# 2. Download vimrc to a temporary file
curl -fsSL --proto '=https' -o ~/.vimrc.new https://raw.githubusercontent.com/shotakaha/editors/main/vim/vimrc

# 3. Replace the current vimrc
mv -f ~/.vimrc.new ~/.vimrc
```

vim-plug and the plugins are installed automatically on the first run.

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
