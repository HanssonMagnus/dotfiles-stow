# memory

Show memory usage as `used/total` (GiB) with percentage, recolouring at
>70/80/90%. Reports RAM by default, or swap when the block instance is `swap`.

## Dependencies

None — reads `/proc/meminfo` directly.

## Config

```ini
[memory]
command=~/.config/i3blocks/my_blocks/memory/memory
label=🐏
interval=30
```
