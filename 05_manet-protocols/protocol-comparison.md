# MANET Routing Protocol Comparison

Several routing protocols have been developed for mesh networks.

This document summarizes key differences between common approaches.

---

## OLSR

Documentation
https://datatracker.ietf.org/doc/html/rfc3626

Characteristics:

* proactive routing protocol
* maintains global network topology
* stable but can generate overhead

---

## BATMAN

Project site
https://www.open-mesh.org/projects/batman-adv/wiki

Characteristics:

* decentralized routing logic
* minimal topology awareness
* operates at Layer 2

---

## Babel

Project documentation
https://www.irif.fr/~jch/software/babel/

Characteristics:

* distance-vector routing
* designed for wireless links
* fast convergence and loop avoidance
