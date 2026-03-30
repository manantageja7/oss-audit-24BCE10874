#!/bin/bash
# Script 1: System Identity Report
# Author: Manan Tageja | Course: Open Source Software
# --- Variables ---
STUDENT_NAME="Manan Tageja" 
SOFTWARE_CHOICE="Git" 

# --- System info ---
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
# Extracting distro name cleanly from os-release
DISTRO=$(cat /etc/os-release | grep -w "NAME" | cut -d "=" -f2 | tr -d '"')
CURRENT_DATE=$(date +"%A, %d %B %Y - %T")

# --- Display ---
echo "================================"
echo " Open Source Audit — $STUDENT_NAME"
echo "================================"
echo "Distro  : $DISTRO"
echo "Kernel  : $KERNEL"
echo "User    : $USER_NAME"
echo "Uptime  : $UPTIME"
echo "Date    : $CURRENT_DATE"
echo "License : The Linux kernel is licensed under the GNU General Public License v2."
