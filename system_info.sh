#!/bin/bash 
echo "================================="
echo "Linux System Information"
echo "================================="
echo ""

USER=$(whoami)
CURRENT_DIR=$(pwd)
CURRENT_DATE=$(date)
CURRENT_SHILL=$(echo $SHELL)
HOSTNAME=$(hostname)
LINUX_DIST=$(cat /etc/os-release | "PRETTY_NAME" | cut -d '"' -f 2)
NUM_FILES=$(ls -1 | wc -l)
DIR_PERMISSIONS=$(ls -ld . | awk '{print $1}')
DISK_USAGE=$(df -h)
MEMORY_USAGE=$(free -h)
echo "Current user: "
echo "$USER"
echo ""
echo "Current Directory: "
echo "$CURRENT_DIR"
echo ""
echo "$Current Date: "
echo "$CURRENT_DATE"
echo ""
echo "Current Shell: "
echo "$CURRENT_SHELL"
echo ""
echo "Hostname:"
echo "$HOSTNAME"
echo ""
echo "Linux Distribution:"
echo "$LINUX_DIST"
echo ""
echo "Number of Files in Current Directory:"
echo "$NUM_FILES"
echo ""
echo "Current Directory Permissions:"
echo "$DIR_PERMISSIONS"
echo ""
echo "Disk Usage:"
echo "$DISK_USAGE"
echo ""
echo "Memory Usage:"
echo "$MEMORY_USAGE"
echo ""

read -p "Enter your name: " USER_NAME
echo "Welcome, $USER_NAME !"
echo ""
 
read -p "Enter a directory name to check: " DIR_NAME
if [ -d "$DIR_NAME" ]; then 
	echo "Directory exists"
else
	echo "Directory not found "
fi 
echo ""

mkdir -p Reports
REPORT_FILE="Reports/system_report.txt"

{
    echo "================================="
    echo "Linux System Information Report"
    echo "================================="
    echo ""
    echo "Current User: $USER"
    echo "Current Directory: $CURRENT_DIR"
    echo "Current Date: $CURRENT_DATE"
    echo "Current Shell: $CURRENT_SHELL"
    echo "Hostname: $HOSTNAME"
    echo "Linux Distribution: $LINUX_DIST"
    echo "Number of Files in Current Directory: $NUM_FILES"
    echo "Current Directory Permissions: $DIR_PERMISSIONS"
    echo ""
    echo "Disk Usage:"
    echo "$DISK_USAGE"
    echo ""
    echo "Memory Usage:"
    echo "$MEMORY_USAGE"
    echo ""
} > "$REPORT_FILE"

echo "Report saved to: $REPORT_FILE"
echo ""

while true; do
    echo ""
    echo "=========== MENU ==========="
    echo "1. Show Current User"
    echo "2. Show Current Date"
    echo "3. Show Directory Permissions"
    echo "4. Show Disk Usage"
    echo "5. Exit"
    echo "============================"
    read -p "Enter your choice (1-5): " CHOICE

    case $CHOICE in
        1)
            echo ""
            echo "Current User: $USER"
            ;;
        2)
            echo ""
            echo "Current Date: $CURRENT_DATE"
            ;;
        3)
            echo ""
            echo "Current Directory Permissions: $DIR_PERMISSIONS"
            ;;
        4)
            echo ""
            echo "Disk Usage:"
            echo "$DISK_USAGE"
            ;;
        5)
            echo ""
            echo "Exiting... Goodbye!"
            break
            ;;
        *)
            echo ""
            echo "Invalid choice! Please enter a number between 1 and 5."
            ;;
    esac
done


echo ""
echo "================================="
echo "End"
echo "================================="
