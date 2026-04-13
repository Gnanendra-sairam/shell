#!/bin/bash
####################################################
# system health monitoring dashboard using shell script
# author: @sairam
# date  : 06/10/2024
# this script is used to monitor the system health of a linux server and display the results in a dashboard format
# the script will display the following information:
# - CPU usage
# - Memory usage
# - Disk usage
# - Network usage
# script usage: ./system_health_monitoring.sh
####################################################
# check cpu usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
# check memory usage
memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
# check disk usage
disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
# check network usage
network_usage=$(ifstat -i eth0 1 1 | awk 'NR==3 {print $1}')
# display the results in a dashboard format
echo "---------------------------------------------"
echo "         System Health Monitoring Dashboard         "
echo "---------------------------------------------"
echo "CPU Usage: $cpu_usage%"
echo "Memory Usage: $memory_usage%"
echo "Disk Usage: $disk_usage%"
echo "Network Usage: $network_usage KB/s"
echo "---------------------------------------------"
