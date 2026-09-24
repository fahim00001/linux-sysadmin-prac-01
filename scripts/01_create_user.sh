#!/bin/bash

# Part 1: Create service user safely

if [ -z "$SVC_NAME" ]; then
    echo "Error: SVC_NAME is not set"
    exit 1
fi

if id "$SVC_NAME" &>/dev/null; then
    echo "User $SVC_NAME already exists"
else
    sudo useradd -r -m -s /usr/sbin/nologin "$SVC_NAME"
    echo "User $SVC_NAME created successfully"
fi
