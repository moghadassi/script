#!/bin/bash
#
# Script: docker-monitor.sh
# Purpose: Monitor resource usage of Docker containers
#
# How to use:
#   1. Save this file as: docker-monitor.sh
#   2. Make it executable:
#        chmod +x docker-monitor.sh
#   3. Run it:
#        ./docker-monitor.sh
#   4. Choose "Live" to see updates every 2 seconds
#      or "Once" for a one-time snapshot

# ---------- Function to show stats ----------
show_stats_once() {
    echo "📊 Showing container resource usage (one-time):"
    docker stats --no-stream \
        --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}"
}

show_stats_live() {
    echo "📡 Live monitoring resource usage (press Ctrl+C to stop):"
    watch -n 2 "docker stats --no-stream \
        --format 'table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}'"
}

# ---------- Menu ----------
echo "====================================="
echo "   🐳 Docker Container Monitor"
echo "====================================="
echo "1) Show resource usage (one-time)"
echo "2) Live monitoring (every 2 seconds)"
echo "q) Quit"
echo "-------------------------------------"
read -p "Select an option: " choice

case $choice in
    1) show_stats_once ;;
    2) show_stats_live ;;
    q) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option! Please try again." ;;
esac
