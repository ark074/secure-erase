#!/bin/bash
set -e
mkdir -p demo out/certs
if [ ! -f demo/test.img ]; then
  fallocate -l 1G demo/test.img
  echo "Created demo/test.img (1G)"
fi
echo "Associate loop device (sudo losetup -fP demo/test.img) and find /dev/loopX; then use UI to target it."
