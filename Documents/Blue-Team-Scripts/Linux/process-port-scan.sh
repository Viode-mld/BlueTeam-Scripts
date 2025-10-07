#!/bin/bash
# Quick situational awareness script

echo "=== Active Users ==="
who -a
echo
echo "=== Top Processes ==="
ps aux --sort=-%cpu | head -15
echo
echo "=== Open Ports ==="
ss -tupln
