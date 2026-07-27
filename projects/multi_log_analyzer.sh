#!/bin/bash
for file in logs/*.log 
do
echo "File: $(basename "$file")"
echo "Total lines: $(wc -l < $file)"
echo "Total Errors: $(grep -i "ERROR" "$file" |wc -l)"
echo "Total Warnings: $(grep -i "WARNING" "$file" |wc -l)"
echo "Total Info: $(grep -i "INFO" "$file" |wc -l)"
echo "=========================="
done