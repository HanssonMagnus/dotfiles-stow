# Dotfiles Managed with GNU Stow

This repository contains personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a Stow package. Stow treats each package as if it were rooted at `$HOME` and creates relative symlinks into the correct locations such as `$HOME` and `$HOME/.config`.

These configs assume an **X11 + i3** desktop and a handful of command-line tools.

## Stow packages

| Package | Symlinks to | What it is |
|---|---|---|
| `bash` | `~/.bashrc`, `~/.bash_aliases`, `~/.bash_profile` | Bash shell, aliases and helper functions |
| `bin` | `~/bin/` | Personal helper scripts (see [bin scripts](#bin-scripts)) |
| `i3` | `~/.config/i3/config` | i3 window manager |
| `i3blocks` | `~/.config/i3blocks/` | Status-bar config and `my_blocks/` scripts |
| `kitty` | `~/.config/kitty/kitty.conf` | Kitty terminal |
| `nvim` | `~/.config/nvim/` | Neovim config (lazy.nvim) — the distro package is `neovim` |
| `picom` | `~/.config/picom/picom.conf` | Compositor |
| `ranger` | `~/.config/ranger/` | Ranger file manager |
| `vim` | `~/.vimrc` | Vim (fallback editor) |
| `wallpapers` | `~/.config/wallpapers/` | Wallpaper images used by i3/feh |
| `xresources` | `~/.Xresources` | X resources (colours, DPI) |
| `zathura` | `~/.config/zathura/zathurarc` | PDF viewer |

## Dependencies

### Core desktop (X11 + i3)

`stow`, `git`, `i3`, `i3blocks`, `dmenu`, `kitty`, `picom`, `feh`, `ranger`,
`zathura`, the `network-manager` applet (`nm-applet`), `autocutsel`, `light`,
`redshift`, `cmus`, `dunst` (notifications), `i3lock` (screen lock),
`alsa-utils` (`amixer`), `pulseaudio-utils` (`pactl`), `xdotool`, `perl`, and the
X11 utilities `xrandr`, `xset`, `xrdb`, `setxkbmap` (from `x11-xserver-utils` /
`x11-xkb-utils`).

### Shell & CLI

`bash`, `neovim`, `vim`, `fzf`, `autojump`, `curl`, `openssl`, `dict`, `xsel`,
`gh` (GitHub CLI), `fastfetch`.

### i3blocks — per-block dependencies

Each block only needs its own tools; skip the ones for blocks you don't use.

| Block | Needs | Block | Needs |
|---|---|---|---|
| `battery` | `acpi`, `perl` | `nosleep` | `xdotool`, `systemd-inhibit`, `xset` |
| `cpu_usage` | `sysstat` (`mpstat`), `perl` | `redshift` | `redshift` |
| `disk` | `coreutils` (`df`) | `protonvpn` | ProtonVPN CLI *(optional, see below)* |
| `memory` | — (`/proc/meminfo`) | `dunst` | `dunst` (`dunstctl`) |
| `temperature` | `lm-sensors` (`sensors`), `perl` | `lock` | `i3lock` |
| `volume` | `alsa-utils` (`amixer`), `pactl`, `perl` | `keyboard_layout` | `setxkbmap` |

### Optional / feature-specific

- **ProtonVPN CLI** — the official ProtonVPN Linux CLI (not in the distro repos; install per ProtonVPN's instructions). Only needed for the `protonvpn` block.
- **TeX toolchain** (`texlive`, e.g. `pdflatex`/`biber`) — for the `bin/comptex` and `bin/comptex_bibtex` LaTeX helpers.
- **`jq` + `mawk`** — for `bin/getblock` (an Ethereum/Erigon node helper).
- **FreeDict data** (`dict-freedict-eng-lat`, `dict-freedict-lat-eng`) — for the `lat`/`eng` dictionary aliases.

## Install

### Ubuntu / Debian

```sh
sudo apt update
sudo apt install -y \
  stow git bash neovim vim ranger kitty picom zathura feh dmenu \
  i3 i3blocks network-manager-gnome autocutsel light redshift cmus \
  dunst i3lock xdotool alsa-utils pulseaudio-utils xsel gh fastfetch perl \
  fzf autojump curl openssl dict \
  acpi sysstat lm-sensors \
  x11-xserver-utils x11-xkb-utils
```

On older Ubuntu releases, `gh` and `fastfetch` may need their own apt repository / PPA (see the GitHub CLI and fastfetch install docs).

Optional extras:

```sh
# dictionary data for the `lat` / `eng` aliases
sudo apt install -y dict-freedict-eng-lat dict-freedict-lat-eng
# LaTeX helpers in bin/ (comptex, comptex_bibtex)
sudo apt install -y texlive
# bin/getblock (Ethereum node helper)
sudo apt install -y jq mawk
```

The `protonvpn` block needs the official ProtonVPN CLI, installed separately per ProtonVPN's Linux instructions.

### Fedora

```sh
sudo dnf install -y \
  stow git bash neovim vim-enhanced ranger kitty picom zathura feh dmenu \
  i3 i3blocks network-manager-applet autocutsel light redshift cmus \
  dunst i3lock xdotool alsa-utils pulseaudio-utils xsel gh fastfetch perl \
  fzf autojump curl openssl dictd \
  acpi sysstat lm_sensors \
  xorg-x11-server-utils xorg-x11-xkb-utils
```

Package names vary between Fedora releases — in particular the X11 utilities (`xrandr`, `xset`, `xrdb`, `setxkbmap`) may live in differently named packages. If a name doesn't resolve, install the package that provides the corresponding command.

## i3blocks bar

The bar is configured in `i3blocks/.config/i3blocks/config`, with one script per block under `i3blocks/.config/i3blocks/my_blocks/`. Current blocks (left to right):

- **`keyboard_layout`** — current X layout; left-click toggles `us` ↔ `se`.
- **`volume`** — volume level; left/right-click toggles mute (`🔇 MUTE`), scroll changes it.
- **`memory`** — RAM used / total.
- **`disk`** — free space on `$HOME`.
- **`temperature`** — CPU temperature.
- **`cpu_usage`** — CPU load.
- **`battery`** — charge and state (prints nothing on a desktop with no battery).
- **`nosleep`** — toggle: keep the system awake and stop the screen blanking.
- **`protonvpn`** — ProtonVPN status; left-click connects / disconnects.
- **`redshift`** — toggle night-vision colour temperature; scroll to adjust warmth.
- **`dunst`** — do-not-disturb toggle (mute / unmute all notifications).
- **`lock`** — left-click to lock the screen (`i3lock`).

Each block has its own `README.md` under `i3blocks/.config/i3blocks/my_blocks/<block>/` documenting its exact config snippet and dependencies.

## bin scripts

The `bin` package installs these to `~/bin/`:

- **`monitor`** — configure displays (workstation vs laptop) with `xrandr`; run from the i3 config on startup.
- **`screensaver`** — turn the screens off (`xset dpms force off`).
- **`getblock`** — fetch the latest block from a local Erigon/Ethereum node (`jq`, `mawk`).
- **`comptex`, `comptex_bibtex`** — compile LaTeX documents (needs a TeX toolchain).
- **`dmenu_commands`** — data file listing commands for the dmenu launcher.

## Usage

From the repository root, stow individual packages:

```sh
stow bash
stow i3
stow i3blocks
```

Or stow everything at once:

```sh
stow */
```

Use `stow */` (with the trailing slash), not `stow *`: the slash restricts Stow to directories, so root-level files like this `README.md` aren't treated as a package. Shell globbing happens before Stow applies any ignore rules, so `stow *` would try to stow the README too.

### Examples

- `bash/.bashrc` → `~/.bashrc`
- `i3/.config/i3/config` → `~/.config/i3/config`
- `i3blocks/.config/i3blocks/config` → `~/.config/i3blocks/config`

### Preview (simulation)

See what Stow would do without creating any symlinks:

```sh
stow --verbose --no */
```

### Restow

Re-stow a package after changing which files it contains:

```sh
stow -R bash
```
