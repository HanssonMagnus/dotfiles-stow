# dunst

A do-not-disturb toggle for the i3bar: left-click to mute/unmute **all** dunst
notifications on demand.

- 🔔 — notifications are on (gruvbox gray)
- 🔕 DND — notifications are muted (gruvbox red)

Muting is non-destructive: notifications received while muted are queued by dunst
and pop when you toggle back on. Nothing is lost.

## Dependencies

- `dunstctl` (ships with dunst) — uses `set-paused toggle` and `is-paused`.

## Config

```ini
[dunst]
command=~/.config/i3blocks/my_blocks/dunst/dunst
interval=once
signal=14
```
