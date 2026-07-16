# volume

Show the system volume as `🔊 <pct>`. **Left- or right-click toggles mute**
(muted shows `🔇 MUTE` in red); **scroll** up/down changes the volume in 5%
steps.

## Dependencies

- `amixer` — from `alsa-utils` (also drives PulseAudio/PipeWire via the `pulse` mixer).
- `perl` — parses the mixer state.

## Config

```ini
[volume]
command=~/.config/i3blocks/my_blocks/volume/volume
min_width=🔊 100%
interval=once
signal=10
```

## Notes

The 🔊/🔇 icons and the red `#FB4934` mute colour are emitted by the script, so
there is no `label=`; `min_width` keeps the block a fixed width. The mixer is
auto-detected — `pulse` for PulseAudio or pipewire-pulse, `jackplug` for JACK,
otherwise `default` — and can be overridden via the `MIXER`/`SCONTROL` env vars.
Set `NATURAL_MAPPING=1` to use amixer's `-M` (alsamixer-style) scaling.
