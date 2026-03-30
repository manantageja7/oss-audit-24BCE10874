#!/bin/bash
# Script 2: FOSS Package Inspector
PACKAGE="git"

# Check if package is installed (Checks both dpkg for Ubuntu/Debian and rpm for Fedora/CentOS)
if dpkg -l $PACKAGE &>/dev/null; then
    echo "$PACKAGE is installed (Debian/Ubuntu)."
    dpkg -s $PACKAGE | grep -E 'Version|Description'
elif rpm -q $PACKAGE &>/dev/null; then
    echo "$PACKAGE is installed (RPM/RedHat)."
    rpm -qi $PACKAGE | grep -E 'Version|License|Summary'
else
    echo "$PACKAGE is NOT installed."
fi

echo "--------------------------------"
# Case statement for philosophy notes
case $PACKAGE in
    httpd|apache2) echo "Apache: the web server that built the open internet" ;;
    mysql) echo "MySQL: open source at the heart of millions of apps" ;;
    git) echo "Git: the decentralized version control tool Linus built when proprietary failed him" ;;
    firefox) echo "Firefox: a nonprofit fighting for an open web" ;;
    *) echo "$PACKAGE: a valuable piece of the open-source ecosystem" ;;
esac
