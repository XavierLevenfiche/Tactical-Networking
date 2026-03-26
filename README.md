# Tactical Networking Research

## Overview

This repository documents an ongoing research project exploring **low-cost tactical networking and team location tracking** using commercially available hardware and open-source software.

The project began with a simple question:

> How can small teams maintain shared situational awareness and communications without relying on cellular networks or expensive military networking systems?

Many professional solutions exist, such as systems produced by Silvus Technologies and Persistent Systems. However, these platforms are designed for government and defense organizations and are typically outside the budget of hobbyist teams, research groups, or volunteer organizations.

Professional systems capable of this exist, such as platforms produced by
Silvus Technologies
(https://silvustechnologies.com) and
Persistent Systems
(https://www.persistentsystems.com).

These systems provide advanced mobile ad-hoc networking capabilities but are typically designed for government or defense organizations.

This project explores whether similar capabilities can be approximated using:

* open-source networking software
* commercial off-the-shelf hardware
* modern wireless mesh technologies

---

## Research Goals

The research focuses on three main objectives:

### 1. Team Location Tracking

Understanding how small teams can share GPS locations in real time using software platforms such as
Android Team Awareness Kit
(https://tak.gov/products/tak/atak).

ATAK is part of the TAK ecosystem developed to provide real-time situational awareness for distributed teams operating in the field.


**2. Tactical Networking**

Learning how data moves across decentralized wireless networks, including:

* mesh networking
* mobile ad-hoc networks (MANET)
* peer-to-peer routing

**3. Low-Cost Infrastructure**

Testing affordable hardware solutions capable of supporting:

* long-range connectivity
* mobile nodes
* field-deployable network infrastructure

---

## Research Approach

The repository documents a **step-by-step learning process**, beginning with basic concepts and gradually progressing toward building a functional network architecture.

Topics explored include:

* team tracking technologies
* LoRa mesh networking
* mesh routing protocols
* WiFi HaLow (802.11ah)
* network architecture design
* field testing methodologies

Each section of the repository reflects a stage of the research process, including:

* notes
* experiments
* diagrams
* lessons learned

---

## Repository Structure

```
00_problem-space
01_team-location-tracking
02_meshtastic-experiments
03_pace-planning
04_tactical-network-basics
05_mesh-networking
06_halow-research
07_network-architecture
08_toc-design
09_field-testing
```

---

## Disclaimer

This repository is a **technical research log** focused on networking technologies and communication infrastructure.

It does not promote or endorse any specific operational use case. The goal is to understand how distributed wireless networks can be built using accessible technologies.

---

# Project Status — Tactical Networking Research

## Overall Progress

| Area                                  | Status         | Notes                                             |
| ------------------------------------- | -------------- | ------------------------------------------------- |
| Problem Definition                    | 🟢 Complete    | Clear understanding of team tracking requirements |
| Tracking Platforms (ATAK / ecosystem) | 🟢 Complete    | Core platform identified                          |
| LoRa / Meshtastic                     | 🟢 Complete    | Strengths & limitations understood                |
| PACE Planning                         | 🟢 Complete    | Communication layering defined                    |
| Device Ecosystem                      | 🟢 Complete    | Smartphones vs dedicated devices evaluated        |
| Operator Hardware                     | 🟢 Complete    | T1000E selected                                   |
| TOC Hardware                          | 🟡 In Progress | Surface identified, further validation needed     |
| Mesh Networking Theory                | 🟢 Complete    | Concepts understood                               |
| MANET Routing Protocols               | 🟢 Complete    | OLSR / BATMAN / Babel researched                  |
| WiFi HaLow Research                   | 🟡 In Progress | Promising but requires implementation             |
| OpenWRT / Mesh Implementation         | 🔴 Not Started | Needs hands-on setup                              |
| Network Architecture Design           | 🟡 In Progress | Early structure defined                           |
| TOC Architecture                      | 🟡 In Progress | Conceptual phase                                  |
| Field Testing                         | 🔴 Not Started | Requires deployment + measurement                 |
| XCOM / Tailscale / Overlay Networking | 🔴 Not Started | Future research area                              |

---

## Legend

* 🟢 Complete — Concept understood and documented
* 🟡 In Progress — Partial understanding or implementation
* 🔴 Not Started — Requires research or testing

---

## Current Focus

Transitioning from **research → implementation**, specifically:

* OpenWRT configuration
* 802.11s mesh setup
* WiFi HaLow deployment
* Network architecture design

---

## Next Milestones

* Build first functional mesh network
* Test routing protocols (Babel vs BATMAN)
* Establish TOC node
* Begin field testing (RSSI / packet loss)

---

## Long-Term Goals

* Reliable off-grid team tracking network
* Layered PACE communication system
* Fully mobile TOC architecture
* Integrated situational awareness platform
