# HaLowLink2 Bench Baseline - 2026-05-29

This note records the first verified bench access to the Diamond Net Morse Micro HaLowLink2 nodes.

It intentionally does not include passwords, Wi-Fi keys, private addresses outside the bench LAN, or operationally sensitive placement details.

## Hardware Reached

Three HaLowLink2 nodes were reached through the local Diamond Net management path:

| Role | Management IP | Hostname | Status |
|---|---:|---|---|
| TOC | 192.168.8.20 | halowlink2-6c1b | SSH reachable |
| TL | 192.168.8.21 | halowlink2-710b | SSH reachable |
| RTO | 192.168.8.22 | halowlink2-6ddb | SSH reachable |

## Firmware

All three nodes reported:

- OpenWrt 23.05.6
- Morse-2.11.8
- Target: ramips/mt7621
- Architecture: mipsel_24kc

## Current Wireless State

Observed configuration:

- 2.4 GHz AP SSID present for local client access.
- Sub-GHz HaLow radio configured as 802.11ah mesh.
- Mesh ID: recorded privately in the local operations vault, not published here.
- Channel: 28.
- Mesh peering was established between all three nodes during the bench check.

## Current Routing / MANET State

The nodes already have the BATMAN Advanced kernel/userland stack installed:

- `kmod-batman-adv`
- `batctl`
- LuCI BATMAN protocol support

However, BATMAN was not active as the forwarding plane at the time of this baseline:

- `batctl if` did not show active hard interfaces.
- No `bat0` topology output was present.
- The current working path appears to be a flat 802.11ah mesh attached to the LAN bridge, not a BATMAN-managed mesh overlay.

This means the BATMAN/OpenMANET-style tooling is installed, but the mesh has not yet been migrated to an OpenMANET-style BATMAN-V topology.

## OpenMANET Compatibility Note

OpenMANET documentation lists HaLowLink2 as tested hardware and describes a BATMAN-V mesh model using `10.41.0.0/16`, `bat0`, `br-ahwlan`, and a router-mode mesh gate.

Release assets checked on 2026-05-29 showed:

- OpenMANET `1.6.4` and `1.6.5` include HaLowLink2 firmware images.
- OpenMANET `1.7.0` introduces voice comms, OpenVLM, BLOS, Web UI, and API support.
- OpenMANET `1.7.0` release assets did not include a HaLowLink2 firmware image in the GitHub API result.
- The OpenMANET docs feature matrix says HaLowLink2 comms is not supported on `1.7.0` yet.

Therefore, these HaLowLink2 nodes should be treated as MANET transport candidates first. Do not assume they can host the new OpenMANET PTT/comms stack until a compatible image and local test prove it.

## Basic Reachability

From each HaLow node, the other HaLow node management IPs were ping-tested.

Observed result:

- TOC to TL/RTO: reachable.
- TL to TOC: reachable.
- TL to RTO: intermittent packet loss in one short 3-packet sample.
- RTO to TOC/TL: reachable.
- All nodes could reach the local gateway.

The short ping sample is only a bench sanity check. It is not a range, throughput, or field reliability test.

## Backups

Before any routing changes, read-only inventories and `/etc/config` backups were captured locally on the mini PC under the private operations vault.

Those backups are not committed to this repository because they may contain sensitive configuration values.

## Next Safe Step

Do not live-migrate the bench mesh into OpenMANET/BATMAN while remote-only unless a rollback timer and local observer are available.

Recommended sequence:

1. Keep the current 802.11ah mesh as the known-good baseline.
2. Decide whether to flash OpenMANET firmware or keep the current Morse/OpenWrt image.
3. If using OpenMANET, verify a HaLowLink2 image exists for the target version and record its checksum.
4. If using manual UCI, write an OpenMANET-shaped BATMAN-V config profile and matching rollback profile.
5. Apply to one non-critical node first with a timed rollback.
6. Verify management access, peer discovery, route/topology output, ping, HTTP access, and client DHCP.
7. Apply to the remaining nodes only after the first node survives rollback-gated testing.
8. Add PTT only after transport is stable; use a supported OpenMANET comms endpoint if HaLowLink2 comms support remains unavailable.

## Boundary

No field test was completed by this baseline.

No firmware flash, package install, DNS/DHCP change, radio power change, credential change, or production routing migration is claimed here.
