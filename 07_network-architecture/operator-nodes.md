# Operator Node Requirements

Operator nodes represent the primary devices used by individuals within the network.

These devices must balance several constraints:

* portability
* battery life
* network connectivity
* ease of use

Key requirements:

* reliable radio connectivity
* ability to transmit location data
* lightweight hardware
* simple user interface

---

# Dedicated Tracking Hardware

In addition to smartphones, dedicated tracking devices may provide advantages for operator nodes.

One example is the
T1000E.

These devices are designed specifically for:

* GPS tracking
* low power operation
* mesh communication

Advantages include:

* longer battery life
* simpler operation
* dedicated tracking functionality

Because these devices focus on a single purpose, they may be well suited for operator-level nodes within a distributed tracking network.

---

# Node Roles

### Operator Node

* carried by individual users
* provides location data
* connects to mesh network

---

### Relay Node

* extends network range
* forwards traffic between nodes

---

### TOC Node

* central coordination point
* may host services
* uses elevated antennas

---

# Addressing Integration

The network uses a segmented addressing model:

* TOC → 192.168.20.x
* Relay → 192.168.21.x
* Operators → 192.168.22.x

This allows:

* easier identification of node roles
* structured network expansion
* improved troubleshooting during field testing

