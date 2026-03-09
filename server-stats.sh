#!/bin/bash

echo "=============================================="
echo "        SERVER PERFORMANCE STATISTICS         "
echo "=============================================="
echo ""

###############################################
# OS Information
###############################################
echo "Operating System:"
cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2
echo ""

###############################################
# System Uptime
###############################################
echo "System Uptime:"
uptime -p
echo ""

###############################################
# Load Average
###############################################
echo "Load Average (1m, 5m, 15m):"
uptime | awk -F'load average:' '{ print $2 }'
echo ""

###############################################
# Logged in Users
###############################################
echo "Logged in Users:"
who
echo ""

###############################################
# Total CPU Usage
###############################################
echo "Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}'
echo ""

###############################################
# Memory Usage
###############################################
echo "Memory Usage:"
free -m | awk 'NR==2{
printf "Total: %sMB\nUsed: %sMB\nFree: %sMB\nUsage: %.2f%%\n",
$2,$3,$4,$3*100/$2 }'
echo ""

###############################################
# Disk Usage
###############################################
echo "Disk Usage:"
df -h --total | grep total | awk '{print "Total:",$2,"\nUsed:",$3,"\nFree:",$4,"\nUsage:",$5}'
echo ""

###############################################
# Top 5 Processes by CPU Usage
###############################################
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo ""

###############################################
# Top 5 Processes by Memory Usage
###############################################
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6
echo ""

###############################################
# Failed Login Attempts (Last 5)
###############################################
echo "Recent Failed Login Attempts:"
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -5
grep "Failed password" /var/log/secure 2>/dev/null | tail -5
echo ""

echo "=============================================="
echo "             END OF REPORT                    "
echo "=============================================="