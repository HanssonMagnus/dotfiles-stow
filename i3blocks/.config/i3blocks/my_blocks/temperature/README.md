# temperature

Show the system temperature in °C (the first `temp1_input` from `sensors`),
turning yellow at the warn threshold (default 70°C) and red/urgent at critical
(default 90°C).

## Dependencies

- `sensors` — from the `lm-sensors` package.

## Config

```ini
[temperature]
command=~/.config/i3blocks/my_blocks/temperature/temperature
label=🌡️
interval=10
```

## Notes

The script accepts `-w`/`-c` threshold flags and `--chip` to select a specific
sensor chip.
