# Dotfiles Managed with GNU Stow

This repository contains personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a Stow package. Stow treats each package as if it were rooted at `$HOME`, and creates relative symlinks into the correct locations such as `$HOME` and `$HOME/.config`.

## Packages

These dotfiles assume an X11 + `i3` setup and a handful of command-line tools.

Core desktop packages used directly by the configs:

- `stow`
- `git`
- `bash`
- `i3`
- `i3blocks`
- `dmenu`
- `kitty`
- `picom`
- `ranger`
- `feh`
- `zathura`
- `network-manager` applet (`nm-applet`)
- `autocutsel`
- `xrandr`
- `setxkbmap`
- `xset`
- `xrdb`
- `light`
- `redshift`
- `cmus`

Shell and helper packages used by aliases or scripts:

- `neovim`
- `vim`
- `fzf`
- `autojump`
- `curl`
- `jq`
- `mawk`
- `openssl`
- `dict`
- `acpi`
- `sysstat`
- `lm_sensors`

### Ubuntu

```sh
sudo apt update
sudo apt install -y \
  stow git bash neovim vim ranger kitty picom zathura feh dmenu \
  i3 i3blocks network-manager-gnome autocutsel light redshift cmus \
  fzf autojump curl jq mawk openssl dict \
  x11-xserver-utils x11-xkb-utils
```

Optional dictionary data for the `lat` and `eng` aliases:

```sh
sudo apt install -y dict-freedict-eng-lat dict-freedict-lat-eng
```

### Fedora

```sh
sudo dnf install -y \
  stow git bash neovim vim-enhanced ranger kitty picom zathura feh dmenu \
  i3 i3blocks network-manager-applet autocutsel light redshift cmus \
  fzf autojump curl jq mawk openssl dictd \
  xrandr setxkbmap xset xrdb
```

Package names can vary slightly between Fedora releases. If one of the X11 utility names differs on your system, install the package providing the corresponding command.

### Notes

- The `i3blocks` config references several helper scripts such as `volume`, `memory`, `disk`, `temperature`, `cpu_usage`, and `battery`, these may have dependencies such as `lm_sensors` that need to be installed.
- The battery block is useful on laptops and harmless to disable on desktops.

## Examples

- `bash/.bashrc` becomes `~/.bashrc`
- `i3/.config/i3/config` becomes `~/.config/i3/config`
- `i3blocks/.config/i3blocks/config` becomes `~/.config/i3blocks/config`

## Usage

From the repository root:

```sh
stow bash
stow i3
stow i3blocks
```

To stow all packages at once:

```sh
stow */
```

Use `stow */` instead of `stow *`. This repository contains documentation files at the root, and shell globbing happens before Stow applies any ignore rules.

## Simulation

Preview what Stow would do without creating symlinks:

```sh
stow --verbose --no */
```

## Restow

Restow a package after changes:

```sh
stow -R bash
```

## Ignore Files

Stow supports package-local ignore files via `.stow-local-ignore` inside a package directory.

This does not apply to files in the repository root such as this `README.md`, so the correct fix is to use `stow */` rather than `stow *`.
