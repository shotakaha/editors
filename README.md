# editors

My editors configurations.

This repository stores the configuration files for the editors I use, such as VS Code, Emacs, Vim and Zed.

## Editors

| Editor | Configuration | Status |
| --- | --- | --- |
| Vim | [vim/vimrc](vim/vimrc) | Available |
| Zed | [zed/settings.json](zed/settings.json), [zed/keymap.json](zed/keymap.json) | Available |
| Emacs | [emacs/init.el](emacs/init.el), [emacs/early-init.el](emacs/early-init.el) | Available |
| VS Code, ... | | Planned |

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

### Emacs

The Emacs configuration targets Emacs 31 and uses the built-in package.el and use-package.
It sets up a minimal completion UI (Vertico, Orderless, Consult, Marginalia, Corfu, Cape) and Doom Modeline.

```sh
# 1. Backup the current configuration (skip if it does not exist)
cp ~/.emacs.d/init.el ~/.emacs.d/init.el.bak
cp ~/.emacs.d/early-init.el ~/.emacs.d/early-init.el.bak

# 2. Download the files to temporary files
mkdir -p ~/.emacs.d
curl -fsSL --proto '=https' -o ~/.emacs.d/init.el.new https://raw.githubusercontent.com/shotakaha/editors/main/emacs/init.el
curl -fsSL --proto '=https' -o ~/.emacs.d/early-init.el.new https://raw.githubusercontent.com/shotakaha/editors/main/emacs/early-init.el

# 3. Replace the current files
mv -f ~/.emacs.d/init.el.new ~/.emacs.d/init.el
mv -f ~/.emacs.d/early-init.el.new ~/.emacs.d/early-init.el
```

Packages are installed from MELPA automatically on the first run.
Run `M-x nerd-icons-install-fonts` once to install the icon fonts.

### Zed

The Zed configuration uses the Emacs base keymap and switches the theme with the system appearance.

```sh
# 1. Backup the current settings (skip if they do not exist)
cp ~/.config/zed/settings.json ~/.config/zed/settings.json.bak
cp ~/.config/zed/keymap.json ~/.config/zed/keymap.json.bak

# 2. Download the files to temporary files
curl -fsSL --proto '=https' -o ~/.config/zed/settings.json.new https://raw.githubusercontent.com/shotakaha/editors/main/zed/settings.json
curl -fsSL --proto '=https' -o ~/.config/zed/keymap.json.new https://raw.githubusercontent.com/shotakaha/editors/main/zed/keymap.json

# 3. Replace the current files
mv -f ~/.config/zed/settings.json.new ~/.config/zed/settings.json
mv -f ~/.config/zed/keymap.json.new ~/.config/zed/keymap.json
```

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
