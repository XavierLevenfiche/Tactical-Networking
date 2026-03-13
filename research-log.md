# Tactical Networking Research Log

This log tracks the progression of research into tactical networking and team location tracking.

The goal of this project is to understand how distributed wireless networks can support situational awareness and communications for small teams operating without traditional infrastructure.

---

### Entry 1 — Project Start

Beginning research into methods for enabling teams to share location data and communications without relying on cellular networks.

Initial focus will be on understanding existing software tools and communication technologies.

---

### Entry 2 — Tracking Architectures

Explored how team tracking systems share location information.

Key discovery: tracking platforms rely on either centralized servers or peer-to-peer networking models.

This distinction will likely influence how off-grid tracking systems must be designed.

---

### Entry 3 — LoRa Networking

Researched LoRa wireless communication and the Meshtastic ecosystem.

Key insight: LoRa offers long communication range but extremely limited bandwidth.

This may affect its ability to support high-frequency location updates for multiple devices.

---

### Entry 4 — LoRa Use Cases

Expanded research into practical applications of LoRa networking.

Observation: LoRa networks work well for low-frequency telemetry and messaging but may struggle with high-frequency data such as rapid location updates.

---

### Entry 5 - Device Lock Limitations

During testing it was discovered that some devices could not be modified due to bootloader restrictions.

These limitations prevented installation of alternative operating systems such as GrapheneOS.

Because of this constraint, the device could not be repurposed for experimentation as a field communication device.

This highlighted the importance of **hardware compatibility when designing field networking systems**.
