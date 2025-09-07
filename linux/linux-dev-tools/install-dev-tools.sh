#!/usr/bin/env bash
set -e

LOGFILE="$HOME/install-dev-tools.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "============================================"
echo "🚀 Starting Full Development & Networking Tools Installation"
echo "🕒 $(date)"
echo "Logs are being saved to $LOGFILE"
echo "============================================"

# 1️⃣ Update package lists and fix broken installs
echo "📦 Updating package lists..."
sudo apt update -y
sudo dpkg --configure -a || true
sudo apt --fix-broken install -y || true

# 2️⃣ Packages to install (with explanations)
packages=(
  # 📂 Source Control & Networking
  curl        # Transfer data from/to a server (supports HTTP, FTP, etc.)
  wget        # Download files from the internet (with resume support)
  git         # Version control system for source code

  # ✍️ Text Editors
  nano        # Simple command-line text editor
  vim         # Powerful text editor with advanced features

  # 📊 Monitoring & Navigation
  htop        # Interactive process viewer (better than top)
  tree        # Display directory structure in a tree format

  # 📦 Archive & Compression Tools
  unzip       # Extract .zip files
  p7zip-full  # Full 7zip package for compression/extraction of many formats
  p7zip-rar   # RAR format support for 7zip

  # 🛠️ Development Essentials
  build-essential # Compiler tools (gcc, g++, make, etc.)

  # 🖥️ Terminal Multiplexer
  tmux        # Split terminal into multiple panes and manage sessions

  # ⚙️ System & Repository Management
  software-properties-common # Manage software repositories
  apt-transport-https        # Enable APT to use https sources
  ca-certificates            # SSL certificates for secure connections
  gnupg                      # Encryption and key management (GPG)

  # ☕ Java
  openjdk-21-jdk # Java Development Kit (JDK 21)

  # 💻 C# / .NET
  dotnet-sdk-8.0        # .NET 8 SDK for development
  dotnet-runtime-8.0    # Runtime environment for .NET apps
  aspnetcore-runtime-8.0 # Runtime for ASP.NET Core applications
  mono-complete         # Open-source implementation of .NET for Linux

  # 🌐 Networking / Net Tools
  netcat-openbsd  # Networking utility for port testing & connections
  nmap            # Network scanner for ports and services
  traceroute      # Trace the route packets take to a destination
  wireshark       # Network traffic analyzer (GUI-based)
  tcpdump         # Capture and display network packets (CLI-based)
  dnsutils        # DNS tools like dig and nslookup
  net-tools       # Legacy networking tools (ifconfig, netstat, etc.)
  whois           # Lookup domain and IP registration info

  # 📝 Editors & IDE
  code            # Visual Studio Code editor

  # 🐳 Docker
  docker.io       # Docker engine for containers
  docker-compose  # Manage multi-container apps with YAML files
)

# 3️⃣ Install packages one by one
for pkg in "${packages[@]}"; do
    echo "👉 Checking $pkg ..."
    if dpkg -s "$pkg" &>/dev/null; then
        echo "✅ $pkg is already installed, skipping."
    else
        echo "⬇️ Installing $pkg ..."
        if sudo apt install -y "$pkg"; then
            echo "✅ $pkg installed successfully."
        else
            echo "⚠️ $pkg failed to install, will retry later."
        fi
    fi
done

# 4️⃣ Retry for failed / partial installs
echo "🔁 Retrying failed installs (if any)..."
sudo dpkg --configure -a || true
sudo apt --fix-broken install -y || true

# 5️⃣ Summary
echo "============================================"
echo "🎉 Installation completed!"
echo "📜 Check logs at: $LOGFILE"
echo "✅ You can re-run this script anytime to complete missing packages."
echo "============================================"

echo "👉 Reminder: Log out and log back in for Docker group changes to take effect."
