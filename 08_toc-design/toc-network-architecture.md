# TOC Network Architecture

The Tactical Operations Center (TOC) acts as a central coordination node within the network.

---

## Responsibilities

* aggregate team location data
* provide situational awareness
* coordinate communication

---

## Network Role

The TOC may function as:

* high-power relay node
* data aggregation point
* interface to external networks

---

## Design Considerations

* elevated antenna placement
* reliable power source
* increased processing capability

---

## Hardware Example

Devices such as:

* Microsoft Surface
  https://www.microsoft.com/surface

may be used due to portability and processing power.

---

## Relevance

The TOC is a critical component for:

* command and control
* network visibility
* coordination across distributed nodes

--- 

## Addressing Integration

The network uses a segmented addressing model:

* TOC → 192.168.20.x
* Relay → 192.168.21.x
* Operators → 192.168.22.x

This allows:

* easier identification of node roles
* structured network expansion
* improved troubleshooting during field testing
