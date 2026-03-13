# Device Platforms for Tactical Networking

## Smartphones

Smartphones provide several advantages:

* integrated GPS
* mapping applications
* network connectivity
* user familiarity

Many situational awareness applications such as
Android Team Awareness Kit
https://tak.gov/products/tak/atak

are designed to run on Android devices.

---

## Platform Limitations

Mixed device ecosystems introduce challenges:

* iOS compatibility limitations
* hardware diversity
* varying battery life

These limitations influence how communication systems must be designed.

---

# Secure Android Platforms

For security-sensitive environments, hardened Android operating systems may be preferred.

One example is
GrapheneOS
https://grapheneos.org

GrapheneOS focuses on:

* strong application sandboxing
* improved exploit protections
* privacy controls

The operating system is primarily supported on
Google Pixel devices.

https://store.google.com

---

## Device Lock Limitations

During testing it was discovered that some devices could not be modified due to bootloader restrictions.

These limitations prevented installation of alternative operating systems such as GrapheneOS.

Because of this constraint, the device could not be repurposed for experimentation as a field communication device.

This highlighted the importance of **hardware compatibility when designing field networking systems**.
