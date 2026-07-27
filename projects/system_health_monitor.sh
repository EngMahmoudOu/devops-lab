#!/bin/bash
echo "============================"
echo "   System Health Monitor"
echo "============================"
echo ""
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "------------"
echo "Disk Usage: "
df -h
echo "------------"
echo "Memory Usage: "
free -h
echo "------------"
echo "System Uptime: "
uptime
echo "------------"