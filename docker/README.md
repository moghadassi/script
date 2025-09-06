# 🐳 Docker Scripts

This folder contains useful **Docker-related scripts** that simplify container and volume management, monitoring, and backup operations.  

These scripts are designed to make it easier for developers and system administrators to handle common Docker tasks quickly and efficiently.  

---

## 📋 Included Scripts

### 1. `docker-monitor.sh`
- **Description:** Monitors resource usage (CPU, Memory, Network I/O, Block I/O) of running containers.  
- **Features:**  
  - One-time snapshot mode.  
  - Live monitoring mode (updates every 2 seconds).  
- **Usage:**  
  ```bash
  chmod +x docker-monitor.sh
  ./docker-monitor.sh
