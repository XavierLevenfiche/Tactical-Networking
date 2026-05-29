# OpenMANET Second-Node Rollout Gate

Status: prepared, not executed

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
