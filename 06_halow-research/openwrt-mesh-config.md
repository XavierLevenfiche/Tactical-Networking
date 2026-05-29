# OpenWRT Mesh Configuration Concepts

Building a mesh network on OpenWRT requires configuring wireless interfaces and enabling mesh protocols.

OpenWRT documentation:
https://openwrt.org/docs/guide-user/network/wifi/mesh/80211s

---

## Core Components

### Mesh Interface

A mesh network requires a dedicated wireless interface configured in:

* mode: `mesh`
* mesh ID: shared network name

---

### Network Interface

The mesh interface is attached to a network bridge that allows traffic to pass between nodes.

---

## Basic Flow

1. Configure wireless interface in mesh mode
2. Assign mesh ID
3. Bridge interface to LAN
4. Enable routing protocol (optional)

## Bench Finding - HaLowLink2

On 2026-05-29, three Morse Micro HaLowLink2 nodes were reached on the bench network.

The current working configuration is a flat 802.11ah mesh attached to the LAN bridge. BATMAN Advanced tooling is already installed on the nodes, including `kmod-batman-adv` and `batctl`, but BATMAN is not yet active as the forwarding plane.

For this hardware, "install BATMAN/OpenMANET-style routing" and "migrate the mesh to BATMAN" are separate steps:

- Install/tooling: already present on the bench nodes.
- Migration/config: not yet performed.

The migration should be rollback-gated because changing the wireless mesh network assignment can cut off management access.

---

## Considerations

* all nodes must share the same mesh ID
* channel selection must match
* encryption settings must match

Misconfiguration of any of these will prevent nodes from connecting.
