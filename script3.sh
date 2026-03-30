#!/bin/bash
# Script 3: Disk and Permission Auditor
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Directory Audit Report"
echo "----------------------"
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld $DIR | awk '{print $1, $3, $4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo "----------------------"
# Check if Git's global config file exists
GIT_CONFIG="$HOME/.gitconfig"
if [ -f "$GIT_CONFIG" ]; then
    CONF_PERMS=$(ls -l $GIT_CONFIG | awk '{print $1, $3, $4}')
    echo "Git Config ($GIT_CONFIG) exists => Permissions: $CONF_PERMS"
else
    echo "Git Config ($GIT_CONFIG) does not exist yet. Run 'git config --global user.name' to create it."
fi
