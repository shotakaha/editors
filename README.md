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
# 0. Set the install path (use ~/.config/vim/vimrc for XDG)
VIMRC=~/.vimrc

# 1. Backup the current vimrc (skip if it does not exist)
cp "$VIMRC" "$VIMRC.bak"

# 2. Download vimrc to a temporary file
mkdir -p "$(dirname "$VIMRC")"
curl -fsSL --proto '=https' -o "$VIMRC.new" https://raw.githubusercontent.com/shotakaha/editors/main/vim/vimrc

# 3. Replace the current vimrc
mv -f "$VIMRC.new" "$VIMRC"
```

vim-plug and the plugins are installed automatically on the first run.

Vim looks for the configuration in the following order and uses the first one that exists:

1. `~/.vimrc`
2. `~/.vim/vimrc`
3. `$XDG_CONFIG_HOME/vim/vimrc` (`~/.config/vim/vimrc` by default, Vim 9.1.0327 or later)

The steps above use `~/.vimrc`.
On a modern environment, `~/.config/vim/` (XDG compliant) is recommended because it keeps the configuration together with other tools under `~/.config/`.
To use it, change `VIMRC` and make sure `~/.vimrc` and `~/.vim/` do not exist, otherwise they take precedence.
[vim/vimrc](vim/vimrc) detects its own location, so vim-plug and the backup, swap and undo directories follow it without further changes.

### Emacs

The Emacs configuration targets Emacs 31 and uses the built-in package.el and use-package.
It sets up a minimal completion UI (Vertico, Orderless, Consult, Marginalia, Corfu, Cape) and Doom Modeline.

```sh
# 0. Set the install directory (use ~/.config/emacs for XDG)
EMACS_DIR=~/.emacs.d

# 1. Backup the current configuration (skip if it does not exist)
cp "$EMACS_DIR/init.el" "$EMACS_DIR/init.el.bak"
cp "$EMACS_DIR/early-init.el" "$EMACS_DIR/early-init.el.bak"

# 2. Download the files to temporary files
mkdir -p "$EMACS_DIR"
curl -fsSL --proto '=https' -o "$EMACS_DIR/init.el.new" https://raw.githubusercontent.com/shotakaha/editors/main/emacs/init.el
curl -fsSL --proto '=https' -o "$EMACS_DIR/early-init.el.new" https://raw.githubusercontent.com/shotakaha/editors/main/emacs/early-init.el

# 3. Replace the current files
mv -f "$EMACS_DIR/init.el.new" "$EMACS_DIR/init.el"
mv -f "$EMACS_DIR/early-init.el.new" "$EMACS_DIR/early-init.el"
```

Emacs looks for the configuration in the following order and uses the first one that exists:

1. `~/.emacs`
2. `~/.emacs.d/`
3. `~/.config/emacs/` (XDG, Emacs 27 or later)

The steps above use `~/.emacs.d/`.
On a modern environment, `~/.config/emacs/` (XDG compliant) is recommended because it keeps the configuration together with other tools under `~/.config/`.
To use it, change `EMACS_DIR` and make sure `~/.emacs` and `~/.emacs.d/` do not exist, otherwise they take precedence.

Packages are installed from MELPA automatically on the first run.
Run `M-x nerd-icons-install-fonts` once to install the icon fonts.

### Zed

The Zed configuration uses the Emacs base keymap and switches the theme with the system appearance.

```sh
# 0. Set the install directory
ZED_DIR=~/.config/zed

# 1. Backup the current settings (skip if they do not exist)
cp "$ZED_DIR/settings.json" "$ZED_DIR/settings.json.bak"
cp "$ZED_DIR/keymap.json" "$ZED_DIR/keymap.json.bak"

# 2. Download the files to temporary files
mkdir -p "$ZED_DIR"
curl -fsSL --proto '=https' -o "$ZED_DIR/settings.json.new" https://raw.githubusercontent.com/shotakaha/editors/main/zed/settings.json
curl -fsSL --proto '=https' -o "$ZED_DIR/keymap.json.new" https://raw.githubusercontent.com/shotakaha/editors/main/zed/keymap.json

# 3. Replace the current files
mv -f "$ZED_DIR/settings.json.new" "$ZED_DIR/settings.json"
mv -f "$ZED_DIR/keymap.json.new" "$ZED_DIR/keymap.json"
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
