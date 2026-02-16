# Tactical Networking

This repository contains my research, field experiments, and lab documentation on tactical mesh networking. It combines practical setups, device testing, scripts, and tools for advanced wireless networks including MANETs, Meshtastic, HaLow, AREDN, OpenWRT, and more.

## 🔹 Repository Overview

I focus on **real-world, field-deployable mesh networks** and network performance analysis. The repo includes:

- **MANETs**: Mobile Ad-hoc network setups, routing experiments, subnet management.
- **Meshtastic**: LoRa-based field communication, device pairing, firmware tweaks.
- **HaLow (IEEE 802.11ah)**: HL2 setups, Rocket/Mango integration, antenna experiments, RSSI & MCS monitoring.
- **AREDN**: Mesh configurations, emergency network experiments, subnet & routing strategies.
- **OpenWRT**: Mesh firmware setups, device bridging, and automation scripts.
- **RTL-SDR**: Signal scanning, drone & Wi-Fi detection, remote ID experiments.
- **Network Tools & Scripts**: Python & PowerShell scripts for Tailscale, ping sweeps, network mapping, logging, and visualization.
- **Field Documentation**: GPS-based site mapping, distance measurements, coverage heatmaps, and antenna/cable experiments.

## 🔹 Repository Structure
      /tactical-networking
      ├── manet/ # MANET setup, scripts, routing notes
      ├── meshtastic/ # LoRa node configs, firmware updates
      ├── halow/ # HL2, DiamondNet, antenna tests, RSSI/MCS logs
      ├── aredn/ # AREDN configs, deployment notes
      ├── openwrt/ # OpenWRT mesh setups, scripts, bridging
      ├── rtl-sdr/ # SDR scanning, Wi-Fi/BLE/drone monitoring
      ├── tools/ # Scripts (Python, PowerShell, utilities)
      ├── docs/ # Diagrams, field notes, PDFs
      └── assets/ # Photos, diagrams, screenshots

## 🔹 Getting Started

      1. Clone the repo:
            git clone https://github.com/<your-username>/tactical-networking.git
      2. Browse the technology-specific folders to explore experiments, scripts, and notes.
      3. Follow folder-level READMEs for setup instructions, deployment tips, and results.

🔹 Key Experiments & Notes (examples from my field work)

      ├── HL2 HaLow & DiamondNet Mesh
      ├── Multi-node flat mesh at 192.168.8.x
      ├── RSSI, MCS, and packet loss tracking for field optimization
      ├── Antenna placement & SMA cable loss experiments
      ├── Meshtastic LoRa
      ├── Cross-device connectivity & firmware testing
      ├── GPS logging for tactical coverage visualization
      ├── AREDN & OpenWRT
      ├── Subnet management and bridging for resilient field routing
      ├── Rocket & Mango device integration
      ├── RTL-SDR
      ├── Remote ID scanning for drones
      ├── Wi-Fi/BLE spectrum monitoring
      ├── Signal logging for situational awareness

Tools & Scripts

      Python & PowerShell scripts for ping sweeps, network mapping, and Tailscale access

      Automation for logging and field monitoring

🔹 Goals

      Document practical tactical mesh networking setups

      Provide actionable scripts, configs, and diagrams

      Analyze field performance: RSSI, packet loss, MCS, coverage

      Support hobbyists, researchers, and emergency network builders

🔹 Contribution

      Open to contributions, feedback, or collaboration. Please open issues or PRs with scripts, setups,             or experiments to share. Thank you to @MKME 

🔹 License

      MIT License — free to use for research, field deployments, and educational purposes.

🔹 Contact / Author Notes

      Xavier Levenfiche – primary author, experimental deployments, and research documentation.
