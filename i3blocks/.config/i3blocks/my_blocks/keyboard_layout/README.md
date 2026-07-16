# keyboard_layout

Show the current X keyboard layout (via `setxkbmap -query`). **Left-click
toggles** between `us` (variant `altgr-intl`) and `se`.

## Dependencies

- `setxkbmap` — reads and sets the X keyboard layout.

## Config

```ini
[key_layout]
command=~/.config/i3blocks/my_blocks/keyboard_layout/keyboard_layout
label=⌨️
interval=30
```

## Notes

The block is named `[key_layout]` in the config. The two toggled layouts mirror
the `us`/`se` aliases in `bash/.bash_aliases` (the commands are hardcoded in the
script). The 30 s interval also picks up layout changes made from the terminal.
