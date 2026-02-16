# Tactical Networking

This repository mirrors the structure of a centralized network management drive, adapted for GitHub sharing. 

It contains:

- Master logs, IP management, and firmware tracking
- Device configurations
- Change logs and credentials reference
- Scripts for deployment, network scans, and monitoring
- Documentation (diagrams, maps, photos)


├── 00_README.md                     # Overview of repo structure and instructions
├── 01_MASTER_NETWORK_LOG.md         # Master log of devices, deployments, network status
├── 02_IP_ADDRESS_MANAGEMENT.xlsx    # IP allocation, subnet assignments, VLANs
├── 03_DEVICE_CONFIGS/               # Folder with JSON/TXT configs per device
│   ├── HL2_Node1_Config.json
│   ├── HL2_Node2_Config.json
│   └── OpenWRT_Node1_Config.txt
├── 05_CHANGE_LOG.md                 # Chronological record of all changes, updates, deployments
├── 06_CREDENTIALS_REFERENCE.md      # Generic credentials, passwords, keys for TacticalNet nodes
├── 07_FIRMWARE_TRACKING.xlsx        # Firmware version tracking for all devices
├── 08_SCRIPT_FOLDER/                # Scripts and automation tools
│   ├── tailscale_connect.ps1
│   ├── ping_sweep.ps1
│   └── plot_rssi.py
├── docs/                            # Diagrams, photos, coverage maps
│   └── network_topology_example.png
