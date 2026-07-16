# battery

Show battery status: charge percentage, `CHR`/`DIS` state and remaining time,
turning red (and urgent) below 5%. On a desktop with no battery the script
prints nothing, so the block simply disappears.

## Dependencies

- `acpi` — reads battery state (`acpi -b`).

## Config

```ini
[battery]
command=~/.config/i3blocks/my_blocks/battery/battery
label=⚡
interval=30
```
