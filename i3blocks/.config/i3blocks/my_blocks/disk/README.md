# disk

Show free space on `$HOME` (or the directory set via `DIR` / the block
instance). The text turns red when free space drops below `ALERT_LOW`
(default 10%).

## Dependencies

- `df` — from coreutils (standard).

## Config

```ini
[disk]
command=~/.config/i3blocks/my_blocks/disk/disk
label=🏠
interval=30
```

## Notes

Pass `-n` to also report network filesystems (skipped by default). `DIR` sets
the directory to check (defaults to `$HOME`); `ALERT_LOW` sets the red
threshold.
