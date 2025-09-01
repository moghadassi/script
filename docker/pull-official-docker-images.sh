#!/bin/bash
# =========================================
# Pull popular official Docker images
#
# Usage:
#   Make it executable --->  sudo chmod +x pull-official-docker-images.sh
#   Run it             --->  sudo ./pull-official-docker-images.sh
#
# Note: Use "sudo" to run this script file
# =========================================

# List of popular official Docker images
images=(
  "nginx:latest"
  "mysql:latest"
  "redis:latest"
  "postgres:latest"
  "mongo:latest"
  "node:latest"
  "python:latest"
  "ubuntu:latest"
  "alpine:latest"
  "golang:latest"
  "busybox:stable-glibc"
)

# Pull all images
for image in "${images[@]}"; do
  echo "Pulling $image ..."
  docker pull $image
done

echo "✅ All images have been pulled successfully."
