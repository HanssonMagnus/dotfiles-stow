# lock

A screen-lock button for the i3bar: left-click 🔒 to lock the screen with
`i3lock --color=000000` (the same lock command as `~/bin/dmenu_commands`).

Stateless action button — it always shows 🔒 and takes no periodic updates.

## Dependencies

- `i3lock`

## Config

```ini
[lock]
command=~/.config/i3blocks/my_blocks/lock/lock
interval=once
```
