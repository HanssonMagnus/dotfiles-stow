# nosleep

Prevent the system from sleeping, blanking the screen, or going idle. Left-click
to toggle. When active (green ☕ on), the block keeps the system awake and resets
the X11 idle counter every 2 minutes so apps like Slack don't mark you as away.

## Dependencies

* `xdotool` — simulates mouse movement to reset the X11 input idle counter
* `systemd-inhibit` — blocks systemd from suspending the system (part of systemd)
* `xset` — controls DPMS and screensaver (part of x11-xserver-utils)

## Config

```ini
[nosleep]
command=~/.config/i3blocks/my_blocks/nosleep/nosleep
interval=once
signal=11
```
