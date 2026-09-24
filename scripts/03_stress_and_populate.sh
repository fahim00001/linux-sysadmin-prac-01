#!/bin/bash

# Part 3: Stress testing and tmpfs population

if [ -z "$SVC_NAME" ]; then
    echo "Error: SVC_NAME is not set"
    exit 1
fi

TMP_DIR="/mnt/${SVC_NAME}_tmp"


cpu_test() {
    echo "Starting CPU stress test..."

    stress-ng --cpu 4 --timeout 60s

    echo "CPU stress test completed"
}


memory_test() {
    echo "Starting memory stress test..."

    stress-ng --vm 1 --vm-bytes 50% --timeout 60s

    echo "Memory stress test completed"
}


disk_test() {
    echo "Starting disk population..."

    if [ ! -d "$TMP_DIR" ]; then
        echo "Error: $TMP_DIR does not exist"
        exit 1
    fi

    echo "Writing test file to $TMP_DIR"

    dd if=/dev/zero of="$TMP_DIR/testfile.img" bs=10M count=20

    echo "Disk population completed"
}


all_test() {
    echo "Starting combined stress test..."

    stress-ng \
        --cpu 4 \
        --vm 1 \
        --vm-bytes 50% \
        --timeout 60s &

    echo "Writing disk test file..."

    dd if=/dev/zero of="$TMP_DIR/testfile.img" bs=10M count=20

    wait

    echo "Combined stress test completed"
}


case "$1" in

    --cpu)
        cpu_test
        ;;

    --mem)
        memory_test
        ;;

    --disk)
        disk_test
        ;;

    --all)
        all_test
        ;;

    *)
        echo "Usage:"
        echo "$0 --cpu"
        echo "$0 --mem"
        echo "$0 --disk"
        echo "$0 --all"
        exit 1
        ;;

esac
