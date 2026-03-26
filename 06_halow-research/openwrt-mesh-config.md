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

---

## Considerations

* all nodes must share the same mesh ID
* channel selection must match
* encryption settings must match

Misconfiguration of any of these will prevent nodes from connecting.
