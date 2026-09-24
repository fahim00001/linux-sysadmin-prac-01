#!/bin/bash

# Part 2: Setup tmpfs storage

if [ -z "$SVC_NAME" ]; then
    echo "Error: SVC_NAME is not set"
    exit 1
fi

TMP_DIR="/mnt/${SVC_NAME}_tmp"

# Create mount point
sudo mkdir -p "$TMP_DIR"

# Mount tmpfs if not already mounted
if mountpoint -q "$TMP_DIR"; then
    echo "$TMP_DIR is already mounted"
else
    sudo mount -t tmpfs -o size=256M tmpfs "$TMP_DIR"
    echo "tmpfs mounted at $TMP_DIR"
fi

# Give ownership to service user
sudo chown "$SVC_NAME:$SVC_NAME" "$TMP_DIR"

echo "tmpfs setup completed"
