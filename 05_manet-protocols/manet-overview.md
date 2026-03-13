# Mobile Ad Hoc Networks (MANET)

A Mobile Ad Hoc Network (MANET) is a type of wireless network where nodes dynamically form connections without fixed infrastructure.

Nodes may join or leave the network at any time.

Routing paths must adapt dynamically to changes in topology.

---

## Key Characteristics

MANET networks typically include:

* dynamic topology
* multi-hop routing
* decentralized architecture

These characteristics allow networks to function in environments where traditional infrastructure is unavailable.

---

## Relevance to Field Networks

MANET architectures are frequently used in environments such as:

* disaster response
* remote operations
* military communications

Because nodes can move freely, routing protocols must constantly adapt to changing conditions.

---

# OLSR Routing Protocol

The Optimized Link State Routing protocol is a proactive routing protocol designed for mobile ad hoc networks.

Official documentation can be found in:

https://datatracker.ietf.org/doc/html/rfc3626

---

## Key Concepts

OLSR continuously exchanges topology information between nodes.

This allows each node to maintain a map of the network and compute optimal routes.

---

## Multipoint Relays

A core feature of OLSR is the concept of **Multipoint Relays (MPRs)**.

Instead of broadcasting messages to all nodes, selected relay nodes forward routing updates.

This reduces network overhead.

--- 

# BATMAN Routing Protocol

The Better Approach To Mobile Adhoc Networking protocol is a routing system designed for decentralized mesh networks.

Project website:

https://www.open-mesh.org/projects/batman-adv/wiki

---

## Design Philosophy

Unlike traditional routing protocols that maintain a full network map, BATMAN nodes only track the best next hop toward a destination.

This simplifies routing decisions and reduces complexity.

---

## Kernel Implementation

BATMAN Advanced (batman-adv) operates at **Layer 2 of the OSI model**, allowing the mesh network to behave like a distributed Ethernet switch.

---

# Babel Routing Protocol

Babel is a distance-vector routing protocol designed for wired and wireless networks.

Official project documentation:

https://www.irif.fr/~jch/software/babel/

---

## Design Goals

Babel was designed to address several limitations of earlier MANET routing protocols.

Key goals include:

* fast convergence
* loop avoidance
* efficient wireless operation

---

## Advantages for Wireless Networks

Babel includes mechanisms for:

* handling fluctuating wireless link quality
* avoiding routing loops
* adapting to changing network conditions

These characteristics make it well suited for dynamic wireless mesh networks.

