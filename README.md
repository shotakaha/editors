# editors

My editors configurations.

This repository stores the configuration files for the editors I use, such as VS Code, Emacs, Vim and Zed.

## Editors

| Editor | Configuration | Status |
| --- | --- | --- |
| Vim | [vim9/vimrc](vim9/vimrc), [vim8/vimrc](vim8/vimrc) | Available |
| Zed | [zed/settings.json](zed/settings.json), [zed/keymap.json](zed/keymap.json) | Available |
| Emacs | [emacs/init.el](emacs/init.el), [emacs/early-init.el](emacs/early-init.el) | Available |
| VS Code, ... | | Planned |

### Vim

The Vim configuration uses [vim-plug](https://github.com/junegunn/vim-plug) for plugins and Emacs-like keybinds.
There are two versions of the configuration.

| File | Target |
| --- | --- |
| [vim9/vimrc](vim9/vimrc) | Vim 9.1.0327 or later |
| [vim8/vimrc](vim8/vimrc) | Vim 8.0 or later |

Installation steps are written at the top of each file.

```sh
# 0. Choose the version and the install path
#    Vim 9.1.0327 or later (XDG compliant)
SRC=vim9
VIMRC=~/.config/vim/vimrc
#    Vim 8.0 or later
# SRC=vim8
# VIMRC=~/.vimrc
URL=https://raw.githubusercontent.com/shotakaha/editors/main

# 1. Backup the current vimrc (skip if it does not exist)
cp "$VIMRC" "$VIMRC.bak"

# 2. Download the vimrc to a temporary file
mkdir -p "$(dirname "$VIMRC")"
curl -fsSL --proto '=https' -o "$VIMRC.new" "$URL/$SRC/vimrc"

# 3. Replace the current vimrc
mv -f "$VIMRC.new" "$VIMRC"
```

vim-plug and the plugins are installed automatically on the first run.

Vim looks for the configuration in the following order and uses the first one that exists:

1. `~/.vimrc`
2. `~/.vim/vimrc`
3. `$XDG_CONFIG_HOME/vim/vimrc` (`~/.config/vim/vimrc` by default, Vim 9.1.0327 or later)

`~/.config/vim/` (XDG compliant) is recommended on a modern environment because it keeps the configuration together with other tools under `~/.config/`.
Make sure `~/.vimrc` and `~/.vim/` do not exist, otherwise they take precedence.
Vim older than 9.1.0327 does not read `~/.config/vim/`, so use `vim8/vimrc` with `~/.vimrc`.
`vim9/vimrc` detects its own location, so vim-plug and the backup, swap and undo directories follow it without further changes.
`vim8/vimrc` always uses `~/.vim/` for them.

### Emacs

The Emacs configuration targets Emacs 31 and uses the built-in package.el and use-package.
It sets up a minimal completion UI (Vertico, Orderless, Consult, Marginalia, Corfu, Cape) and Doom Modeline.

```sh
# 0. Set the install directory (use ~/.emacs.d for the legacy location)
EMACS_DIR=~/.config/emacs
URL=https://raw.githubusercontent.com/shotakaha/editors/main

# 1. Backup the current configuration (skip if it does not exist)
cp "$EMACS_DIR/init.el" "$EMACS_DIR/init.el.bak"
cp "$EMACS_DIR/early-init.el" "$EMACS_DIR/early-init.el.bak"

# 2. Download the files to temporary files
mkdir -p "$EMACS_DIR"
curl -fsSL --proto '=https' -o "$EMACS_DIR/init.el.new" "$URL/emacs/init.el"
curl -fsSL --proto '=https' -o "$EMACS_DIR/early-init.el.new" "$URL/emacs/early-init.el"

# 3. Replace the current files
mv -f "$EMACS_DIR/init.el.new" "$EMACS_DIR/init.el"
mv -f "$EMACS_DIR/early-init.el.new" "$EMACS_DIR/early-init.el"
```

Emacs looks for the configuration in the following order and uses the first one that exists:

1. `~/.emacs`
2. `~/.emacs.d/`
3. `~/.config/emacs/` (XDG, Emacs 27 or later)

The steps above use `~/.config/emacs/` (XDG compliant), which is recommended on a modern environment because it keeps the configuration together with other tools under `~/.config/`.
Make sure `~/.emacs` and `~/.emacs.d/` do not exist, otherwise they take precedence.
For an older Emacs, change `EMACS_DIR` to `~/.emacs.d`.

Packages are installed from MELPA automatically on the first run.
Run `M-x nerd-icons-install-fonts` once to install the icon fonts.

### Zed

The Zed configuration uses the Emacs base keymap and switches the theme with the system appearance.

```sh
# 0. Set the install directory
ZED_DIR=~/.config/zed
URL=https://raw.githubusercontent.com/shotakaha/editors/main

# 1. Backup the current settings (skip if they do not exist)
cp "$ZED_DIR/settings.json" "$ZED_DIR/settings.json.bak"
cp "$ZED_DIR/keymap.json" "$ZED_DIR/keymap.json.bak"

# 2. Download the files to temporary files
mkdir -p "$ZED_DIR"
curl -fsSL --proto '=https' -o "$ZED_DIR/settings.json.new" "$URL/zed/settings.json"
curl -fsSL --proto '=https' -o "$ZED_DIR/keymap.json.new" "$URL/zed/keymap.json"

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
