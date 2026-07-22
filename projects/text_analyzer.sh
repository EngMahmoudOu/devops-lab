#!/bin/bash
echo "========== Text Analyzer =========="
echo ""
read -p "📄 Enter a file name:" FILE
if [ -f $FILE ]; then
echo "📄 File: $FILE"
echo ""
echo "📊 Lines: $(wc -l < "$FILE")"
echo "📝 Words: $(wc -w < "$FILE")"
echo "🔠 Characters: $(wc -m < "$FILE")"
echo ""
echo "🔍 First 2 Lines"
head -2 "$FILE"
echo "🔍 Last 2 Lines"
tail -2 "$FILE"

else
echo "❌ File does not exist"
fi