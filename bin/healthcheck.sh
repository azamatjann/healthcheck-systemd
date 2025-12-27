#!/usr/bin/env bash

LOG_DIR="$HOME/projects/healthcheck/logs"
LOG_FILE="$LOG_DIR/healthcheck.log"

mkdir -p "$LOG_DIR"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEM=$(free -m | awk '/Mem:/ { printf("%.1f"), $3/$2*100 }')
DISK=$(df -h / | awk 'NR==2 {print $5}')

echo "$(date '+%Y-%m-%d %H:%M:%S') | CPU: ${CPU}% | MEM: ${MEM}% | DISK: ${DISK}" >> "$LOG_FILE"
