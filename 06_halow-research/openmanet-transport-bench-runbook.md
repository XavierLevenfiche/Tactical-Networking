# OpenMANET Transport Bench Runbook

Status: ready for bench planning, not executed

This runbook is the next practical step for the HaLowLink2 routers. It focuses only on OpenMANET transport. Push-to-talk is intentionally deferred until the transport layer is stable.

## Goal

Create a verified OpenMANET-compatible HaLow transport baseline without losing management access.

Success means:

- the nodes use OpenMANET-compatible BATMAN-V forwarding
- client devices can obtain mesh addresses
- management access still works
- traffic crosses the HaLow path reliably enough for later TAK/dashboard/PTT tests

## Hard Boundaries

- Do not flash firmware until the exact image and checksum are recorded.
- Do not change all three nodes at once.
- Do not call this a field test.
- Do not claim PTT works from this runbook.
- Do not publish credentials, Wi-Fi keys, private backups, or exact field placement.

## Known Starting State

Verified on 2026-05-29:

| Role | IP | Hostname | State |
|---|---:|---|---|
| TOC | 192.168.8.20 | halowlink2-6c1b | reachable |
| TL | 192.168.8.21 | halowlink2-710b | reachable |
| RTO | 192.168.8.22 | halowlink2-6ddb | reachable |

Current baseline:

- OpenWrt 23.05.6 Morse-2.11.8
- HaLow 802.11ah mesh on channel 28
- BATMAN tooling installed
- BATMAN not active as the forwarding plane
- config backups saved privately on the mini PC

## Decision Point

Choose one path before touching routers:

### Path A - OpenMANET Firmware

Use this if a compatible HaLowLink2 OpenMANET image exists for the target feature set.

Required before flash:

- release tag
- asset filename
- SHA256 checksum
- recovery method
- physical/local access
- post-flash management plan, because `sysupgrade -n` will not keep current `192.168.8.x` config

Known release check from 2026-05-29:

- OpenMANET `1.6.4` and `1.6.5` had HaLowLink2 images.
- OpenMANET `1.7.0` added comms/PTT features but did not expose a HaLowLink2 image in the checked release assets.
- HaLowLink2 comms is not assumed supported on `1.7.0`.

Firmware dry-run check from 2026-05-29:

- `openmanet-1.6.5-halowlink2-mm8108-squashfs-sysupgrade.bin` checksum verified as `644907eb386e859293a696000bbc097efd57dd8ef09c891b1faeff255c627555`.
- `sysupgrade -T` on TL confirmed the device is supported.
- The same dry-run reported config incompatibility for config-preserving upgrade and requires `sysupgrade -n`.
- No flash was performed during the dry-run.

First-node flash result from 2026-05-29:

- TL was flashed only after fresh backups and a post-flash `10.41.254.2/16` management route were prepared on `diamond-toc`.
- Flash required `sysupgrade -F -n`.
- TL came back as OpenMANET `24.10 1.6.5` at `10.41.254.1`.
- HTTP/LuCI and SSH were recovered.
- TOC and RTO were not flashed.
- Stop condition remains active for the rest of the nodes until TL is configured and a multi-node OpenMANET transport check passes.

### Path B - Manual OpenWrt UCI

Use this if keeping the current Morse/OpenWrt firmware and manually aligning network config to OpenMANET's BATMAN-V shape.

Required before config:

- current `/etc/config/network`
- current `/etc/config/wireless`
- rollback command armed
- one-node-only change

## OpenMANET Target Shape

Preferred OpenMANET-compatible model:

```text
HaLow 802.11s/mesh -> BATMAN-V bat0 -> br-ahwlan -> local Ethernet / AP clients
```

Addressing model:

- mesh domain: `10.41.0.0/16`
- mesh gate range: `10.41.0.0/24`
- safe static ranges: `10.41.253.0/24` and `10.41.254.0/24`
- fresh-flash default: `10.41.254.1`

## Preflight Checklist

Run before any change:

```sh
date -u
ssh root@192.168.8.20 hostname
ssh root@192.168.8.21 hostname
ssh root@192.168.8.22 hostname
```

On each node:

```sh
cat /etc/openwrt_release
ip -br addr
ip route
uci show network
uci show wireless
batctl if || true
batctl n || true
batctl o || true
iw dev wlan0 station dump
```

Record:

- firmware version
- active management IP
- mesh peers
- current BATMAN state
- backup path

## Single-Node Config Test

Start with one non-critical node.

Before applying any config, save local rollback files on that node:

```sh
cp /etc/config/network /root/network.pre-openmanet
cp /etc/config/wireless /root/wireless.pre-openmanet
```

Arm timed rollback:

```sh
(sleep 180; cp /root/network.pre-openmanet /etc/config/network; cp /root/wireless.pre-openmanet /etc/config/wireless; wifi reload; /etc/init.d/network reload) &
echo $! > /tmp/openmanet-rollback.pid
```

Apply only the minimum config needed for the selected path.

Verify immediately:

```sh
ip -br addr
ip route
batctl if
batctl n
batctl o
ping -c 3 192.168.8.1
ping -c 3 192.168.8.20
```

If still reachable and correct:

```sh
kill "$(cat /tmp/openmanet-rollback.pid)"
rm -f /tmp/openmanet-rollback.pid
```

If uncertain, let rollback fire.

## Transport Pass Criteria

Do not proceed to all-node rollout until the first node passes:

- SSH management remains reachable.
- Web management remains reachable.
- `batctl if` lists the expected hard interface.
- `batctl n` shows at least one neighbor.
- `batctl o` shows originators when multiple nodes are active.
- a client can obtain the expected mesh address if the OpenMANET `10.41.0.0/16` model is active.
- 5 minutes of pings complete without unexpected loss.
- local HTTP traffic works across the mesh path.

## All-Node Rollout Gate

Only after the first node passes:

1. Record exact config diff.
2. Apply the same rollback-gated process to the next node.
3. Re-test topology after every node.
4. Save post-change backups.
5. Update the test log.

Additional gate after the 2026-05-29 TL flash:

- do not flash TOC or RTO until TL setup wizard/CLI config is completed
- current verified TL state: OpenMANET `1.6.5` is reachable at `10.41.254.1`, but `batctl if` / `batctl n` are empty, `uci show openmanet` is empty, and logs show mesh-config / ALFRED missing-interface errors
- subsequent rollback-gated TL mesh activation moved TL to `10.41.100.89`; `br-ahwlan` and `bat0` came up and `batctl if` reports `wlan0: active`, but final validation stopped when the `diamond-toc` relay stopped replying
- confirm TL role/name/channel policy
- confirm `openmanetd`, BATMAN, DHCP, and client access are stable
- confirm the docs model being followed: OpenMANET `1.6.5` observed state versus newer `bat0`/`br-ahwlan` documentation
- do not flash RTO while the Surface jump host depends on RTO's old `DIAMONDNET` AP for Tailscale access
- prefer a local browser or wired/local management path for the TL wizard because the current Tailscale-to-Surface-to-TL relay is too intermittent for further mutations

## Post-Transport Tests

After all selected nodes are stable:

```sh
batctl if
batctl n
batctl o
ping -c 50 <peer-ip>
iperf3 -c <peer-ip>
curl -I http://<service-ip>:8080/
```

If TAK/dashboard traffic is in scope:

- confirm client reaches the mini PC portal
- confirm dashboard loads
- confirm TAK/OpenAIS endpoint reachability
- record what worked and what did not

## Stop Conditions

Stop and restore baseline if:

- more than one management path disappears
- repeated packet loss appears after the config change
- `batctl` has no interface or no neighbors
- DHCP behavior is inconsistent
- the OpenMANET target version lacks the needed HaLowLink2 support
- firmware dry-run requires `sysupgrade -n` and no post-flash management path has been verified

## Output To Record

Add a test-log entry with:

- date/time
- path chosen: firmware or manual UCI
- image/checksum if flashed
- node changed
- config diff summary
- `batctl` output summary
- ping/HTTP/throughput result
- pass/fail
- rollback status

## Next After Transport

Only after this runbook passes:

1. TAK/dashboard traffic test.
2. OpenMANET BLOS test if relevant.
3. PTT-over-MANET test using a supported comms endpoint.
