#!/bin/bash
for file in logs/*.log
do
echo "File: $(basename "$file")"
echo "Total lines: $(wc -l < "$file")"
echo "Total Errors: $(grep -i "ERROR" "$file" |wc -l)"
echo "Total Warning: $(grep -i "Warning" $file |wc -l)"
echo "Total Info: $(grep -i "Info" "$file" |wc -l)"
echo "==================================="
done