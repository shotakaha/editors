# editors

My editors configurations.

This repository stores the configuration files for the editors I use, such as VS Code, Emacs, Vim and Zed.

## Editors

| Editor | Configuration | Status |
| --- | --- | --- |
| Vim | [vim9/vimrc](vim9/vimrc), [vim8/vimrc](vim8/vimrc) | Available |
| Zed | [zed/settings.json](zed/settings.json), [zed/keymap.json](zed/keymap.json) | Available |
| Emacs | [emacs31/](emacs31/), [emacs28/](emacs28/) | Available |
| VS Code | [vscode/](vscode/) | Available |

### Task

In a clone of this repository, [Task](https://taskfile.dev/) installs the configuration files to the XDG paths.
The existing files are saved as `<file>.bak`.

| Task | Destination |
| --- | --- |
| `task install:vim9` | `$XDG_CONFIG_HOME/vim/vimrc` |
| `task install:emacs31` | `$XDG_CONFIG_HOME/emacs/init.el`, `early-init.el` |
| `task install:zed` | `$XDG_CONFIG_HOME/zed/settings.json`, `keymap.json` |
| `task install:vscode` | `Code/User/settings.json`, `keybindings.json` (`~/.config` on Linux, `~/Library/Application Support` on macOS) |

`$XDG_CONFIG_HOME` defaults to `~/.config`.
`install:vim9` and `install:emacs31` stop if the legacy files (`~/.vimrc`, `~/.vim/vimrc`, `~/.emacs`, `~/.emacs.d`) exist, because they take precedence over the XDG paths.
The older configurations (`vim8/`, `emacs28/`) are installed with the steps below.

### Shell

The installation steps below are written for bash and zsh.
In fish, replace the variable assignments in step 0 with `set`.
The other steps work as they are (fish 3.4 or later).

```fish
# Vim (set one of them)
set SRC vim9
set VIMRC ~/.config/vim/vimrc
# set SRC vim8
# set VIMRC ~/.vimrc

# Emacs (set one of them for SRC)
set SRC emacs31
# set SRC emacs28
set EMACS_DIR ~/.config/emacs

# Zed
set ZED_DIR ~/.config/zed

# Common
set URL https://raw.githubusercontent.com/shotakaha/editors/main
```

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

The Emacs configuration uses use-package.
It sets up a minimal completion UI (Vertico, Orderless, Consult, Marginalia, Corfu, Cape) and Doom Modeline.
There are two versions of the configuration.

| Directory | Target | use-package | Package manager |
| --- | --- | --- | --- |
| [emacs31/](emacs31/) | Emacs 31 | Built-in (since Emacs 29) | package.el (built-in) |
| [emacs28/](emacs28/) | Emacs 28 or later | Installed with straight.el | [straight.el](https://github.com/radian-software/straight.el) (bootstrapped in `early-init.el`) |

Each directory has `init.el` and `early-init.el`.

```sh
# 0. Choose the version and the install directory (use ~/.emacs.d for the legacy location)
#    Emacs 31
SRC=emacs31
#    Emacs 28 or later
# SRC=emacs28
EMACS_DIR=~/.config/emacs
URL=https://raw.githubusercontent.com/shotakaha/editors/main

# 1. Backup the current configuration (skip if it does not exist)
cp "$EMACS_DIR/init.el" "$EMACS_DIR/init.el.bak"
cp "$EMACS_DIR/early-init.el" "$EMACS_DIR/early-init.el.bak"

# 2. Download the files to temporary files
mkdir -p "$EMACS_DIR"
curl -fsSL --proto '=https' -o "$EMACS_DIR/init.el.new" "$URL/$SRC/init.el"
curl -fsSL --proto '=https' -o "$EMACS_DIR/early-init.el.new" "$URL/$SRC/early-init.el"

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

Packages are installed automatically on the first run (MELPA for `emacs31/`, and git clones by straight.el for `emacs28/`, which also needs `git`).
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

### VS Code

The VS Code configuration uses [Awesome Emacs Keymap](https://marketplace.visualstudio.com/items?itemName=tuttieee.emacs-mcx) and [VSpaceCode](https://vspacecode.github.io/).
VSpaceCode opens with `M-m` in the editor and with `SPC` when the sidebar is focused.

| File | Scope | Use |
| --- | --- | --- |
| [vscode/settings.json](vscode/settings.json) | User | Copied by `task install:vscode` |
| [vscode/keybindings.json](vscode/keybindings.json) | User | Copied by `task install:vscode` |
| [vscode/extensions.json](vscode/extensions.json) | Workspace | Copy to `.vscode/` of a project |
| [vscode/tasks.json](vscode/tasks.json) | Workspace | Copy to `.vscode/` of a project |
| [vscode/launch.json](vscode/launch.json) | Workspace | Copy to `.vscode/` of a project |

To install the user files without Task:

```sh
# 0. Set the install directory (Linux; on macOS use ~/Library/Application\ Support/Code/User)
CODE_DIR=~/.config/Code/User
URL=https://raw.githubusercontent.com/shotakaha/editors/main

# 1. Backup the current settings (skip if they do not exist)
cp "$CODE_DIR/settings.json" "$CODE_DIR/settings.json.bak"
cp "$CODE_DIR/keybindings.json" "$CODE_DIR/keybindings.json.bak"

# 2. Download the files to temporary files
mkdir -p "$CODE_DIR"
curl -fsSL --proto '=https' -o "$CODE_DIR/settings.json.new" "$URL/vscode/settings.json"
curl -fsSL --proto '=https' -o "$CODE_DIR/keybindings.json.new" "$URL/vscode/keybindings.json"

# 3. Replace the current files
mv -f "$CODE_DIR/settings.json.new" "$CODE_DIR/settings.json"
mv -f "$CODE_DIR/keybindings.json.new" "$CODE_DIR/keybindings.json"
```

## Project templates

The `templates/` directory also has starting points for projects.
Copy the files to the project root and replace the placeholders.
Files that start with `.` (`.clangd`, `.clasp.json`) are hidden in `ls`; use `ls -a`.

| Template | Files | Placeholders |
| --- | --- | --- |
| [templates/python/](templates/python/) | `pyproject.toml` (uv, ruff, zensical) | `PROJECT_NAME`, `PROJECT_DESCRIPTION` |
| [templates/web/](templates/web/) | `biome.json` (HTML, CSS) | |
| [templates/gas/](templates/gas/) | `tsconfig.json`, `.clasp.json`, `biome.json` (Google Apps Script, TypeScript, clasp) | `YOUR_SCRIPT_ID` |
| [templates/cpp/](templates/cpp/) | `CMakeLists.txt`, `CMakePresets.json`, `.clangd`, `src/main.cpp` (C++, ROOT, Geant4, CMake) | `PROJECT_NAME` |

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
