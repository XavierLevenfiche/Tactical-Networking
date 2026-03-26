# IP Addressing Strategy

A structured IP addressing scheme improves network organization and troubleshooting.

---

## Proposed Subnet Structure

| Role           | Subnet          |
| -------------- | --------------- |
| TOC            | 192.168.20.0/24 |
| TL Nodes       | 192.168.21.0/24 |
| RTO Nodes      | 192.168.22.0/24 |

---

## Benefits

* clear separation of node roles
* easier debugging and monitoring
* scalable architecture

---

## Considerations

Routing must allow communication between subnets.

This may require:

* static routes
* dynamic routing protocols (Babel, OLSR)

---

## Relevance

This structure supports:

* logical network design
* easier expansion
* improved visibility during testing
