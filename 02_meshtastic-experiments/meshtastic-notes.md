# Meshtastic and LoRa Networking

## Overview

One potential solution for off-grid communication is **LoRa radio technology**.

LoRa (Long Range) is a wireless communication technology developed by
Semtech.

Technical documentation for LoRa can be found through the LoRa Alliance:

https://lora-alliance.org

LoRa is designed for:

* long range communication
* low power consumption
* low bandwidth data transmission

Unlike WiFi networks, LoRa prioritizes **range and efficiency over throughput**.


LoRa is designed for:

* long range communication
* low power consumption
* low data rates

A popular open-source project built on LoRa is
Meshtastic
(https://meshtastic.org).

Meshtastic enables small radios to form decentralized LoRa **mesh networks** capable of exchanging messages and telemetry without requiring cellular infrastructure.

The project is open source and its codebase is available on GitHub:

https://github.com/meshtastic/firmware


---

Unlike traditional WiFi networks, LoRa prioritizes distance and power efficiency over data throughput.

## Typical LoRa characteristics:
* range: several kilometers depending on terrain
* data rate: extremely low compared to WiFi
* power usage: optimized for battery-powered devices


## Potential Advantages

* long communication range
* low hardware cost
* decentralized mesh networking
* off-grid operation

These characteristics make LoRa attractive for field communication systems.

---

## Potential Limitations

LoRa radios operate at extremely low data rates.

While suitable for short messages and location updates, the bandwidth may be insufficient for applications requiring more frequent data transmission.

Further experimentation will be required to evaluate whether LoRa mesh networking is sufficient for reliable team location tracking.

---

## Why LoRa is Interesting

These properties make LoRa suitable for applications such as:

* environmental sensors
* remote telemetry
* location beacons
* simple messaging

Because LoRa can operate without cellular infrastructure, it has potential applications for **off-grid communication networks**.

--- 

# Meshtastic Platform

One open-source project built on LoRa technology is:

Meshtastic

Meshtastic allows small radios to form a **decentralized mesh network**.

In this network:

* each node can relay messages
* data can hop between multiple nodes
* communication does not require internet access

---

## Basic Operation

Each Meshtastic device can perform several roles:

* send messages
* receive messages
* relay messages for other nodes

Because nodes forward traffic for others, the network can extend its range as more nodes join.

This behavior is known as **mesh networking**.

---

## Message Propagation

Messages in a LoRa mesh network typically follow a **store-and-forward model**.

In this model:

1. A device sends a message
2. Nearby nodes receive it
3. Some nodes retransmit the message
4. The message propagates across the network

This allows communication beyond the direct radio range of a single device.

---

## Node Relay Behavior

Nodes may relay messages based on several factors:

* signal strength
* network configuration
* hop limits

Because LoRa bandwidth is limited, networks often restrict the number of times a message may be retransmitted.

This helps prevent network congestion.

---

## Bandwidth Limitations

While LoRa offers impressive communication range, it comes with significant limitations.

LoRa data rates are typically measured in **kilobits per second**, which is far lower than WiFi.

This creates several constraints:

* limited message throughput
* slower update frequency
* difficulty transmitting large data payloads

For applications that require frequent updates—such as real-time location tracking—this limitation may become significant.

---

## Implications for Team Tracking

If multiple devices attempt to transmit frequent location updates, the network may experience:

* message delays
* dropped transmissions
* congestion

Further research will be required to determine whether LoRa mesh networking can support reliable location sharing for multiple users.

---

# Practical Use Cases for LoRa Networks

Because LoRa prioritizes **range and power efficiency over bandwidth**, it is best suited for specific types of communication workloads.

Common use cases include:

### Telemetry

Devices transmit small packets of sensor data at infrequent intervals.

Examples:

* environmental monitoring
* weather stations
* remote infrastructure monitoring

### Short Messaging

LoRa mesh networks can support simple text messaging between nodes.

Example systems include:

* Meshtastic
  https://meshtastic.org

### Location Beaconing

Devices periodically transmit GPS coordinates that can be shared across a mesh network.

Because the messages are small, this works well within LoRa bandwidth limits.

---

## Relevance to Team Tracking

Location beacons require significantly less bandwidth than full mapping or data sharing systems.

This suggests LoRa may be suitable for:

* simple location reporting
* low frequency position updates

However, higher update rates or additional data traffic may exceed the capacity of LoRa networks.
