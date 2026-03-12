# Meshtastic and LoRa Networking

## Overview

One potential solution for off-grid communication is **LoRa radio technology**.

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
