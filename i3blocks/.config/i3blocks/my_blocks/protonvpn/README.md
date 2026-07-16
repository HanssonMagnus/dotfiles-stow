# protonvpn

Show whether ProtonVPN is connected, and the connected server if so. Left-click
to toggle the connection (connects to the fastest global server, or
disconnects if already connected).

When connected, shows `🌐 <server> in <location>` in green (e.g. `🌐 SE#370 in
Stockholm, Sweden`). When disconnected, shows `🌐 not connected` in grey.

## Design

VPN state can change from outside the block (e.g. `protonvpn connect` typed
directly in a terminal), so the block polls rather than only updating on
click. To avoid spawning a slow `protonvpn status` call (~1s, since it fetches
an updated server list over the network) on every poll, the block instead
checks for the existence of the `proton0` WireGuard interface
(`/sys/class/net/proton0`) every tick — a plain filesystem check with no
subprocess cost. `protonvpn status` is only actually invoked when:

* the interface just appeared (a fresh connection), or
* the cached status is older than 5 minutes (self-heals if you switch servers
  via the terminal without ever dropping the interface — see Limitations), or
* you click the block (which forces a fresh fetch since the state just
  changed)

**Limitation**: if you switch servers while already connected (e.g.
`protonvpn connect --country X` in a terminal, without disconnecting first)
and the `proton0` interface never goes down, the block won't notice the new
server until the 5-minute cache refresh or a manual click.

## Dependencies

* `protonvpn` — the official ProtonVPN CLI, logged in (`protonvpn signin`)

## Config

```ini
[protonvpn]
command=~/.config/i3blocks/my_blocks/protonvpn/protonvpn
interval=3
signal=12
```
