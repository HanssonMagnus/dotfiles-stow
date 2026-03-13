# Dotfiles Managed with GNU Stow

This repository contains personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a Stow package. Stow treats each package as if it were rooted at `$HOME`, and creates relative symlinks into the correct locations such as `$HOME` and `$HOME/.config`.

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
