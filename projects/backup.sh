#!/bin/bash
echo "========== Backup Utility =========="
echo ""
read -p "Directory you want to Backup: " Directory
if [ -d "$Directory" ]; then
mkdir -p backups
DATE=$(date +%F)
echo "$DATE"
NAME=$(basename "$Directory")
echo "$NAME"
tar -czf backups/${NAME}-${DATE}.tar.gz "$Directory"
echo ""
echo "✅ Backup Created Successfuly!"
echo "📄 File: backups/${NAME}-${DATE}.tar.gz"
echo ""
else
echo "Directory Not Found"
fi
echo "=============================="