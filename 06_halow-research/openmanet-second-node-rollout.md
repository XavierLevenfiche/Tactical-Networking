# OpenMANET Second-Node Rollout Gate

Status: executed for TOC on 2026-05-29/30

This note defines the next safe move after the first HaLowLink2 OpenMANET node, TL, was flashed and configured.

## Current Verified State

As of 2026-05-29:

- TL is OpenMANET `24.10 1.6.5`.
- TL management moved to `10.41.100.89`.
- TL TCP `80` and `22` are reachable from `diamond-toc`.
- TL has `br-ahwlan`, `bat0`, and HaLow `wlan0` active under BATMAN-V.
- `batctl if` reports `wlan0: active`.
- `batctl n` returns a BATMAN-V table with no neighbors yet.
- `openmanetd` reports `running`.
- ALFRED still needs local/direct confirmation because the nested relay timed out during that check.

This is a single-node OpenMANET/BATMAN baseline. It is not a verified multi-node mesh.

## Executed TOC Result

TOC was flashed as the second OpenMANET node after TL passed the single-node gate.

Observed result:

- TOC left original management IP `192.168.8.20`.
- TOC first came back as fresh OpenMANET at `10.41.254.1`.
- TOC was then configured into the same `br-ahwlan` / `bat0` / `batmesh0` shape as TL.
- TOC received management IP `10.41.138.82`.
- TL remained at `10.41.100.89`.
- TL and TOC both show each other as BATMAN-V neighbors.
- TL and TOC web/SSH were reachable from `diamond-toc`.
- `openmanetd` and `alfred` reported `running` on TOC.
- RTO remained untouched on original Morse/OpenWrt at `192.168.8.22`.

This is a verified two-node bench mesh over OpenMANET/BATMAN. It is not a field test.

## Bench Traffic Result

Basic two-node traffic checks passed on 2026-05-30:

- `tools/halow-openmanet-status.sh` completed cleanly for TL and TOC.
- Bidirectional IPv4 and IPv6 ping had `0%` loss.
- TL -> TOC IPv4 ping average: `1.863 ms`.
- TOC -> TL IPv4 ping average: `1.104 ms`.
- TL -> TOC IPv6 ping average: `1.302 ms`.
- TOC -> TL IPv6 ping average: `1.583 ms`.
- Temporary HTTP `4 MiB` file transfer succeeded both directions.
- TOC -> TL HTTP transfer: `1.48s`.
- TL -> TOC HTTP transfer: `1.30s`.
- `iperf` was not installed; BusyBox `nc` on the image could not listen, so no iperf-style throughput result is claimed.

These are bench management/traffic checks only. They do not prove field range, TAK traffic, PTT, or BLOS.

## Third-Node RTO Stop Condition

RTO remains the original Diamond Net access/recovery anchor. Do not flash it until the management path no longer depends on RTO's `DIAMONDNET` AP.

Attempted management-path migration on 2026-05-30:

- Surface was reachable on `Lobster Shack Mesh`, but that path could not reach TL/TOC/RTO management addresses.
- `DIAMONDNET-5G` profile was installed on the Surface.
- A guarded switch to `DIAMONDNET-5G` was attempted with delayed fallback to `Lobster Shack Mesh`.
- Surface dropped from Tailscale/SSH and did not recover during polling.
- RTO was not flashed or changed.

Required before RTO:

- Recover Surface locally.
- Prove Surface can remain reachable over Tailscale while connected to a network that reaches TL/TOC/RTO management, or add a second management interface.
- Re-run `tools/halow-openmanet-status.sh`.
- Confirm RTO backup and firmware dry-run immediately before flash.

## Second-Node Candidate

Preferred next node: TOC.

Do not flash RTO next while the Surface may still depend on RTO's original `DIAMONDNET` access path. RTO should stay as the access/recovery anchor until the Surface can manage TL/TOC through another stable path.

## Must Be True Before Flashing TOC

- `diamond-toc` is reachable over Tailscale SSH.
- A local browser or stable wired/local path can open `http://10.41.100.89/`.
- TL checks pass with `tools/halow-openmanet-status.sh`.
- Fresh TOC backup exists in the private operations vault.
- OpenMANET `1.6.5` HaLowLink2 firmware checksum is available locally.
- The operator accepts that TOC will leave `192.168.8.20` after `sysupgrade -F -n`.
- RTO remains untouched and reachable on the original Diamond Net path.

## TOC Flash Plan

1. Confirm Surface is not relying on TOC for its current management path.
2. Confirm TL remains reachable at `10.41.100.89`.
3. Confirm RTO remains reachable on original Diamond Net.
4. Back up TOC `/etc/config` and inventory again.
5. Copy the verified OpenMANET `1.6.5` HaLowLink2 sysupgrade image to TOC.
6. Run `sysupgrade -T` on TOC and record output.
7. If supported and the only blocker is config incompatibility, use `sysupgrade -F -n`.
8. Wait for TOC to come back on OpenMANET addressing.
9. Discover TOC's new `10.41.x.x` address from Surface ARP, DHCP leases, LuCI, or BATMAN/OpenMANET status.
10. Verify TOC web/SSH, `batctl if`, `batctl n`, `openmanetd`, and ALFRED.
11. Confirm TL and TOC see each other as BATMAN neighbors.

## Pass Criteria After TOC

- TL and TOC both reachable over management.
- `batctl n` on TL shows TOC as a neighbor.
- `batctl n` on TOC shows TL as a neighbor.
- `batctl o` shows expected originators.
- Web UI remains reachable for both nodes.
- RTO remains unchanged and reachable as rollback/access anchor.

## Stop Conditions

Stop and do not flash RTO if:

- Surface relay becomes unstable again.
- TL disappears from `10.41.100.89` without a known replacement address.
- TOC does not return on web/SSH.
- `batctl if` is empty on either OpenMANET node.
- `batctl n` has no neighbors after both TL and TOC are OpenMANET nodes.
- RTO becomes unreachable on the original management path.

## Boundary

This plan does not claim field testing, PTT, TAK, or BLOS readiness. It only covers the second-node transport rollout gate.
