# Team Location Tracking Platforms

## Situational Awareness Software

Several software platforms exist that allow teams to share their GPS locations and display them on a shared map.

These systems are often referred to as **situational awareness platforms**.

One of the most widely known platforms is
Android Team Awareness Kit
(https://tak.gov/products/tak/atak).

ATAK provides a mapping interface that allows team members to share their positions and communicate across a network.

Official documentation for the TAK ecosystem can be found at:

https://tak.gov

ATAK allows users to:

* share real-time GPS positions
* display team members on a map
* exchange messages
* coordinate movements

---

## Device Ecosystem

One challenge with ATAK is that it is primarily designed for Android devices.

This creates limitations for mixed device environments where some users operate:

* Android phones
* iPhones
* tablets
* dedicated radios

Because of these differences, additional networking layers may be required to enable cross-platform connectivity.

---

## Networking Requirement

Situational awareness software requires a network capable of transmitting location data between devices.

This raises an important question:

If cellular networks are unavailable, **what type of network can carry this data?**

Possible options include:

* radio networks
* mesh networking
* peer-to-peer wireless systems

---

## Centralized vs Peer-to-Peer Tracking

Location tracking systems generally operate in one of two architectures.

### Centralized Systems

Centralized systems rely on a server that receives location updates from devices and distributes those updates to other users.

Advantages:

* easier coordination
* consistent data synchronization

Disadvantages:

* requires internet connectivity
* introduces single point of failure

---

### Peer-to-Peer Systems

Peer-to-peer systems allow devices to exchange location information directly without requiring a central server.

Advantages:

* works without internet infrastructure
* more resilient to network disruptions

Disadvantages:

* more complex network routing
* potential for slower synchronization

Understanding these architectures is important when designing **off-grid team tracking systems**.

