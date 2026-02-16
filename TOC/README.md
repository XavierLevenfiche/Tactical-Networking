# Tactical Networking

# Team Location & Comms: Methods Review

This folder documents our experiments, research, and lessons learned in establishing **reliable and cost-efficient team communications and location tracking**. Over time, we’ve evaluated multiple technologies to create a functional **Tactical Operations Center (TOC)** without the budget for high-end solutions like Silvus or MPU5 radios.

---

## 🔹 Technologies We’ve Tested

### **1. Meshtastic (LoRa)**
* **What it is:** Low-power, long-range mesh network for small devices.
* **Use case:** Lightweight position tracking, text comms, GPS logging.
* **Pros:** Extremely cheap, battery-efficient, portable, works off-grid.
* **Cons:** Limited data rate (~2–10 kbps), not ideal for video or large files.
* **Notes:** We used GPS logging and paired multiple nodes to create a field coverage map for TOC situational awareness.

### **2. MANETs (Mobile Ad-hoc Networks)**
* **What it is:** Self-organizing IP-based mesh networks over Wi-Fi or Ethernet.
* **Use case:** Dynamic peer-to-peer routing for teams moving in the field.
* **Pros:** Fully IP-based, supports common network tools (ping, SSH, Tailscale).
* **Cons:** Can be tricky to configure routing and subnets in larger meshes; performance drops with more nodes.
* **Notes:** We ran OLSR and similar protocols across HL2s and OpenWRT devices to test flat vs. routed mesh topologies.

### **3. HaLow / HL2 Mesh (802.11ah)**
* **What it is:** Low-power Wi-Fi mesh technology.
* **Use case:** Extended range mesh at higher throughput than LoRa.
* **Pros:** Works on longer distances than traditional Wi-Fi; compatible with standard IP.
* **Cons:** Hardware cost higher than LoRa, still much cheaper than Silvus; line-of-sight needed for best performance.
* **Notes:** We experimented with antenna placement, cable lengths, RSSI/MCS tracking, and roof vs. mast deployments for reliable neighborhood coverage.

### **4. ATAK / XToc / XCom**
* **What they are:** Tactical situational awareness apps and overlays.
* **Use case:** Map-based real-time team location sharing.
* **Pros:** Integrates GPS locations from multiple sources; supports markers, chat, and overlay of maps.
* **Cons:** Software doesn’t replace the mesh — it depends on a reliable network layer; requires nodes feeding location data.
* **Notes:** We tested connecting Meshtastic and HL2 meshes to ATAK-compatible feeds to create live TOC dashboards.

---

## 🔹 Lessons Learned

1. **Hybrid Approach Works Best**  
   * No single technology covers all needs. LoRa + HaLow + MANET + ATAK integration gives a balance of cost, coverage, and functionality.

2. **Budget-Friendly Alternatives Are Viable**  
   * Small HL2 nodes and Meshtastic devices provide much of the situational awareness of expensive tactical radios at a fraction of the cost.

3. **Network Design Matters**  
   * Flat vs. routed meshes, IP/subnet planning, and antenna placement significantly affect reliability.  
   * Tracking RSSI, MCS, and packet loss helps optimize node placement in the field.

4. **Automation & Logging Are Key**  
   * Scripts for ping sweeps, GPS logging, and RSSI visualization allow you to quickly evaluate network health and coverage without constant manual monitoring.

5. **Scalability Considerations**  
   * While small teams are easy to manage, the network can become unstable with too many nodes if routing or frequencies aren’t properly managed.  
   * Keeping a consistent subnet/IP plan and documented configs ensures predictable expansion.

---

## 🔹 Conclusion

Building a **reliable and cost-efficient TOC** is possible without Silvus or MPU5s. By combining low-cost mesh nodes (Meshtastic), mid-range IP-capable meshes (HL2/HaLow, OpenWRT), and situational awareness apps (ATAK, XToc), we’ve been able to:

* Track team positions in real time  
* Maintain comms over multiple miles  
* Log network performance and improve deployment iteratively  
* Keep costs manageable for small teams  


---

This folder will serve as a reference for **configurations, lessons learned, scripts, and logs** from our experiments.


This repository mirrors the structure of a centralized network management drive, adapted for GitHub sharing. 

It contains:

- Master logs, IP management, and firmware tracking
- Device configurations
- Change logs and credentials reference
- Scripts for deployment, network scans, and monitoring
- Documentation (diagrams, maps, photos)
