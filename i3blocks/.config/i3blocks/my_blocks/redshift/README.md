# redshift

Toggle redshift's "night vision" color temperature override. Left-click to
turn it on or off; scroll over the block while it's on to adjust how warm the
screen is.

When on, shows `🖥 on <temp>K` in green (e.g. `🖥 on 3500K`). When off, shows
`🖥 off 6500K` in grey — 6500K is redshift's neutral point (no color
adjustment), which is what `redshift -x` resets to, so it's an accurate label
for the off state and keeps the block's width from jumping when you toggle.

Scroll up warms the screen further (lower Kelvin), scroll down moves back
toward neutral (higher Kelvin), in steps of 250K, clamped between 1000K and
6500K (6500K is neutral daylight — no visible effect). Scrolling only does
anything while the block is on; it's a no-op while off.

Turning it off always resets to neutral, and turning it back on always starts
fresh at the 3500K default — it does not resume whatever temperature you'd
scrolled to before switching it off.

## Design

`redshift -O <temp>` is a one-shot manual override, not a daemon — unlike
`nosleep`, there's no background process or PID to check for current state.
So state is tracked explicitly in `/tmp`, the same way `protonvpn` tracks
state that isn't independently queryable:

* `/tmp/i3blocks_redshift_state` — literal `on` or `off`
* `/tmp/i3blocks_redshift_temp` — the current Kelvin value while on, updated
  as you scroll so the displayed number and the next scroll step both stay
  in sync; reset to the 3500K default every time the block is turned on

Each `-O` call passes `-P` (reset existing gamma ramps first) — without it,
some drivers only honor the first `-O` call in a session and silently ignore
later ones, so scrolling past the first tick would update the block's text
but not the actual screen.

**Limitation**: since this only invokes `redshift -O`/`redshift -x` directly
(not the daemon-based aliases in `.bash_aliases`), if something else resets
the gamma ramps outside of this block (e.g. a monitor hotplug, or running
`rson`/`rsoff` manually from a terminal) the block's on-screen state can drift
out of sync with the actual display until you next click or scroll it.

## Dependencies

* `redshift` — the CLI (also used by the `rson`/`rsoff` aliases in
  `bash/.bash_aliases`)

## Config

```ini
[redshift]
command=~/.config/i3blocks/my_blocks/redshift/redshift
interval=once
signal=13
```
