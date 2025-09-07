 # All-in-One Development & Networking Tools Installer

This script installs a comprehensive set of **development tools**, **C#/.NET**, **Java**, **networking utilities**, **Docker**, and **VS Code** on Ubuntu-based systems.  
It is designed to be **resumable**, meaning if the installation is interrupted, you can re-run the script and it will continue installing only the missing or partially installed packages.

---

## 🛠️ Tools Installed

### 1. Development Tools
- `nano`,`curl`, `wget`, `git`, `build-essential`, `vim`, `tmux`, `tree`, `htop`, `unzip`, `software-properties-common`, `apt-transport-https`, `ca-certificates`, `gnupg`

### 2. Java
- `openjdk-21-jdk`

### 3. C# / .NET
- `dotnet-sdk-8.0`, `dotnet-runtime-8.0`, `aspnetcore-runtime-8.0`, `mono-complete`

### 4. Networking & Net Tools
- `netcat-openbsd`, `nmap`, `traceroute`, `wireshark`, `tcpdump`, `dnsutils`, `net-tools`, `whois`

### 5. Editors & IDE
- Visual Studio Code (`code`)

### 6. Docker
- `docker.io`, `docker-compose`

---

## ⚡ Features

- Automatically checks for **already installed packages** and skips them.  
- Handles **partial installs or interruptions**: you can safely re-run the script anytime.  
- Saves installation logs to `~/install-dev-tools.log` for troubleshooting.  
- Updates package lists and fixes broken dependencies automatically.  

---

## 📌 Usage

1. Make the script executable:
```bash
chmod +x install-dev-tools.sh
```

2. Run the script with `sudo`:
```bash
sudo ./install-dev-tools.sh
```

3.Wait for the installation to complete. Logs will be saved to:
```bash
~/install-dev-tools.log
```

4.Important: For Docker to work properly, log out and log back in after the script finishes.


🔁 Re-running the Script
If the installation was interrupted for any reason, simply re-run the script:
```bash
sudo ./install-dev-tools.sh
```


📄 Notes

- Tested on Ubuntu 22.04 / 24.04.

- Designed for amd64 architecture.

- Some packages may require additional permissions during installation (e.g., Wireshark).

-----------------------------------
  ❤️ Contributing

Feel free to suggest new packages or improvements by submitting a pull request or issue.
