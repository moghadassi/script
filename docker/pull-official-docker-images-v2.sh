#!/bin/bash
# =========================================
# Pull popular official Docker images (Interactive Version)
#
# Usage:
#   Make it executable --->  sudo chmod +x pull-official-docker-images-v2.sh
#   Run it             --->  sudo ./pull-official-docker-images-v2.sh
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

# Ask user if they want to add more images
read -p "Do you want to add any other official Docker images? (y/N): " add_more
if [[ "$add_more" =~ ^[Yy]$ ]]; then
  while true; do
    read -p "Enter the image name (or leave empty to finish): " user_image
    if [[ -z "$user_image" ]]; then
      break
    fi
    images+=("$user_image")
    echo "✅ Added $user_image"
  done
fi

# Pull all images
for image in "${images[@]}"; do
  echo "Pulling $image ..."
  docker pull $image
done

echo "✅ All images have been pulled successfully."
