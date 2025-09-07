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

# 2️⃣ Packages to install
packages=(
  # 📂 Source Control & Networking
  curl wget git

  # ✍️ Text Editors
  nano vim

  # 📊 Monitoring & Navigation
  htop tree

  # 📦 Archive & Compression Tools
  unzip p7zip-full p7zip-rar

  # 🛠️ Development Essentials
  build-essential

  # 🖥️ Terminal Multiplexer
  tmux

  # ⚙️ System & Repository Management
  software-properties-common apt-transport-https ca-certificates gnupg
  
  # ☕ Java
  openjdk-21-jdk

  # 💻 C# / .NET
  dotnet-sdk-8.0 dotnet-runtime-8.0 aspnetcore-runtime-8.0 mono-complete

  # 🌐 Networking / Net Tools
  netcat-openbsd nmap traceroute wireshark tcpdump dnsutils net-tools whois

  # 📝 Editors & IDE
  code

  # 🐳 Docker
  docker.io docker-compose
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
