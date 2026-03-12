# Problem Definition

## Background

Small teams operating in remote or infrastructure-limited environments often rely on handheld radios for voice communications. While effective for coordination, traditional voice radios provide **no shared visual awareness of team positions**.

This creates several challenges:

* limited situational awareness
* difficulty coordinating movements
* risk of losing track of team members
* slower decision making

Modern situational awareness platforms exist that allow teams to share their GPS locations in real time.

One widely used example is Android Team Awareness Kit.

However, these platforms typically rely on:

* cellular data networks
* centralized servers
* reliable internet connectivity

In many environments, these assumptions do not hold.

---

## Core Problem

How can small teams maintain **shared situational awareness and location tracking** without relying on cellular infrastructure?

A potential solution requires three components:

1. Devices capable of reporting location
2. A communication network capable of transmitting that data
3. Software capable of displaying team positions

This project explores whether these capabilities can be built using **low-cost and widely available technologies**.
