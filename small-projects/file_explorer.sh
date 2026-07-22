#!/bin/bash
echo "========== File Explorer =========="
echo ""
read -p "📁 Enter a directory: " DIRECTORY
echo ""
if [ -d "$DIRECTORY" ]
then
echo "📁 Directory: $DIRECTORY"
echo "📄 Files:"
ls -lah "$DIRECTORY"
echo ""
echo "📊 Number of files:"
find "$DIRECTORY" -type f | wc -l
echo ""
echo "💾 Directory Size:"
du -sh "$DIRECTORY"

else
echo "❌ Directory does not exist."
fi