#!/bin/bash
echo "====================================="
echo "            Log Analyzer"
echo "====================================="
echo ""
read -p "📄 Enter log file: $FILE" FILE
if [ -f "$FILE" ]; then
echo ""
echo "📄 File: $FILE"
echo ""
echo "Total lines: $(wc -l < "$FILE")"
echo ""
echo "❌ Error lines: $(grep -i "ERROR" "$FILE" | wc -l)"
echo ""
echo "⚠️ Warning lines: $(grep -i "WARNING" "$FILE" | wc -l)"
echo ""
echo "ℹ️ Info lines: $(grep -i "INFO" "$FILE" | wc -l)" 
echo ""
echo "Last 10 lines"
tail -10 "$FILE"
echo ""
else
echo "❌ File Not Found"
fi
echo "========================================"