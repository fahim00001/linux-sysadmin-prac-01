#!/bin/bash

SVC_NAME="bgdsvc_fahim001"

TMPDIR="/mnt/${SVC_NAME}_tmp"
LOGDIR="/var/log/${SVC_NAME}"

MON="/usr/local/bin/${SVC_NAME}_monitor.sh"
CLEAN="/usr/local/bin/${SVC_NAME}_cleanup_old_files.sh"
LOGROTATE="/etc/logrotate.d/${SVC_NAME}"

echo "=== Cleanup for ${SVC_NAME} ==="

echo "[1/6] Killing processes..."
sudo pkill -u "$SVC_NAME" 2>/dev/null || true

echo "[2/6] Removing cron..."
sudo crontab -r -u "$SVC_NAME" 2>/dev/null || true

echo "[3/6] Removing scripts..."
sudo rm -f "$MON"
sudo rm -f "$CLEAN"
sudo rm -f "$LOGROTATE"

echo "[4/6] Unmounting tmpfs..."
if mountpoint -q "$TMPDIR"; then
    sudo umount "$TMPDIR"
fi

sudo rmdir "$TMPDIR" 2>/dev/null || true

echo "[5/6] Removing logs..."
sudo rm -rf "$LOGDIR"

echo "[6/6] Removing user..."
sudo userdel -r "$SVC_NAME" 2>/dev/null || true

echo "=== Verification ==="

id "$SVC_NAME" 2>&1 || echo "User removed"

mount | grep "$SVC_NAME" || echo "No mounts"

ps -u "$SVC_NAME" || echo "No processes"

echo "Cleanup completed"
