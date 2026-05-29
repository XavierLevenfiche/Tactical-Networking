# OpenMANET / BATMAN Migration Plan For HaLowLink2

Status: planned, not applied

This plan converts the existing HaLowLink2 802.11ah mesh from a flat bridge-forwarded mesh into an OpenMANET-aligned BATMAN-V forwarding plane.

The package/tooling layer is already present on the verified 2026-05-29 nodes. The remaining work is a configuration migration.

## OpenMANET Docs Check - 2026-05-29

OpenMANET documentation materially changes the preferred path. The goal should not be a generic hand-rolled BATMAN config unless we are deliberately diverging from OpenMANET.

Verified from OpenMANET docs/releases:

- OpenMANET's current network model uses a flat `10.41.0.0/16` mesh.
- Nodes use `bat0` and bridge client access through `br-ahwlan`.
- The routing layer is BATMAN-V over 802.11s.
- A single mesh gate runs router/NAT mode for uplink separation.
- Every mesh point serves local DHCP for directly attached Ethernet/Wi-Fi clients.
- HaLowLink2 is documented as tested hardware with MM8108, channel 28, `bcf_mm_hl2_ext.bin`, and BATMAN-V routing.
- Stable OpenMANET `1.7.0` introduced voice comms, OpenVLM, BLOS, experimental Web UI, and full API support.
- Stable `1.7.0` release assets checked through the GitHub API did not include a HaLowLink2 image; HaLowLink2 images were present in `1.6.4` and `1.6.5`.
- OpenMANET's own feature matrix says HaLowLink2 has core network/BLOS/UI support but comms is not supported on `1.7.0` yet.

Conclusion: the HaLowLink2 routers should be treated as the MANET transport baseline first. Push-to-talk should be tested through OpenMANET-supported comms endpoints such as Pi/Venice/OpenVLM/Web UI unless a current HaLowLink2 comms-capable image is verified.

## Why Treat This As Risky

The current management path depends on the existing LAN bridge and mesh behavior. Moving the HaLow mesh interface away from `lan` and into a BATMAN hard-interface can temporarily cut off SSH/HTTP management.

Do not apply this plan without:

- a current `/etc/config` backup
- physical access or a local observer
- a timed rollback job already running on the target node
- a single-node test before all-node rollout

## Current Known-Good Baseline

- Management subnet: `192.168.8.0/24`
- TOC node: `192.168.8.20`
- TL node: `192.168.8.21`
- RTO node: `192.168.8.22`
- HaLow mode: 802.11ah mesh
- BATMAN packages: present
- BATMAN active forwarding: not yet active

## Candidate OpenMANET Shape

The preferred target shape is OpenMANET's documented model:

```text
HaLow 802.11s -> BATMAN-V bat0 -> br-ahwlan -> Ethernet / local AP clients
```

Addressing target:

- mesh domain: `10.41.0.0/16`
- mesh gates: `10.41.0.0/24`
- fresh-flash node: `10.41.254.1`
- safe static ranges: `10.41.253.0/24` and `10.41.254.0/24`

Client rule:

- if a tablet/laptop/TAK device gets a `10.41.x.x` address, it is on the OpenMANET mesh.

Operational rule:

- use OpenMANET's firmware/wizard/openmanetd path if a compatible HaLowLink2 image is available for the desired feature set.
- avoid manual UCI drift from OpenMANET unless the reason is documented.

## Generic OpenWrt Shape

The modern OpenWrt BATMAN pattern uses:

- `proto 'batadv'` for the virtual BATMAN interface.
- `proto 'batadv_hardif'` for the underlying mesh hard interface.
- The wireless mesh iface assigned to the BATMAN hard-interface network, not directly to `lan`.
- LAN bridging to the BATMAN interface only after management reachability is understood.

Candidate network concepts:

```text
wireless mesh iface -> bat_hardif -> bat0 -> br-lan
```

Do not paste this blindly into a live router. Prefer the OpenMANET firmware/wizard path when possible; use manual OpenWrt UCI only as a fallback or lab variant.

## Decision Gate Before Any Flash Or Config Change

1. Confirm target feature:
   - transport-only MANET
   - PTT over MANET
   - BLOS
   - ATAK Voice plugin interop
2. Confirm target hardware role:
   - HaLowLink2 transport node
   - Pi/Venice/OpenVLM voice endpoint
   - TAK/Android voice client
3. Confirm firmware asset:
   - HaLowLink2 image exists for target OpenMANET version
   - checksum recorded
   - release notes match target feature
4. Confirm rollback:
   - current config backup retained
   - physical access or local observer available
   - timed rollback for config-only changes
   - firmware recovery path for flash changes

## Rollback-Gated Config Sequence

1. Confirm latest backup exists.
2. Save pre-change config on the target node:

   ```sh
   cp /etc/config/network /root/network.pre-batman
   cp /etc/config/wireless /root/wireless.pre-batman
   ```

3. Arm a rollback in a background shell before applying changes:

   ```sh
   (sleep 180; cp /root/network.pre-batman /etc/config/network; cp /root/wireless.pre-batman /etc/config/wireless; wifi reload; /etc/init.d/network reload) &
   echo $! > /tmp/batman-rollback.pid
   ```

4. Apply the minimal candidate config on one non-critical node.
5. Reload wireless/network.
6. Verify:

   ```sh
   ip -br addr
   ip route
   batctl if
   batctl n
   batctl o
   ping -c 3 192.168.8.1
   ping -c 3 192.168.8.20
   ```

7. If verification passes, cancel rollback:

   ```sh
   kill "$(cat /tmp/batman-rollback.pid)"
   rm -f /tmp/batman-rollback.pid
   ```

8. Repeat for the next node only after documenting the result.

## Pass Criteria

Minimum pass before calling OpenMANET/BATMAN active:

- `batctl if` shows the expected hard interface.
- `batctl n` shows neighbor nodes.
- `batctl o` shows originators.
- All management IPs remain reachable.
- HTTP/SSH management remains reachable.
- client obtains a valid OpenMANET mesh address if using the OpenMANET `10.41.0.0/16` model.
- At least 5 minutes of repeated pings pass with no unexpected dropouts.

## PTT Over MANET Gate

Do not call PTT working until all of these pass:

- OpenMANET comms is enabled on a supported endpoint.
- A talk group exists with known multicast address and RTP/RTCP port pair.
- Web UI or OpenVLM can transmit and receive locally.
- `tcpdump` on `br-ahwlan` shows RTP packets for the talk group during PTT.
- a receiving node or ATAK Voice plugin client plays audio.
- both directions are tested if claiming interop.
- capture stats show no material dropped frames or encode errors.

OpenMANET comms uses Opus over multicast RTP, talk groups, half-duplex gating, jitter buffering, and optional browser/Web UI PTT. The ATAK Voice plugin path requires RTP multicast mode and matching multicast address/port/protocol.

## Fail Criteria

Rollback immediately if:

- SSH drops and does not return inside the rollback window.
- `batctl if` is empty after reload.
- management IP becomes unreachable.
- the node cannot reach the local gateway.
- a second node shows packet loss or route instability after the first migration.

## Publishing Boundary

Do not update public project status to "OpenMANET implemented", "BATMAN implemented", or "PTT working" until the pass criteria above are recorded in a test log.

Do not publish passwords, Wi-Fi keys, private backup archives, or exact field placements.
