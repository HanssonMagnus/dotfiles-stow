# cpu_usage

Show CPU usage as `100 − %idle` (from `mpstat`), recolouring the text at the
warn/critical thresholds (normal is gruvbox `#EBDBB2`).

## Dependencies

- `mpstat` — from the `sysstat` package.

## Config

```ini
[cpu_usage]
command=~/.config/i3blocks/my_blocks/cpu_usage/cpu_usage
label=🧠
interval=10
min_width=🧠 100.00%
```

## Notes

The script accepts `-w`/`-c` threshold flags and `-d` for decimal places.
`min_width` reserves room for the widest value so the block doesn't jitter.
