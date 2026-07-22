#!/bin/bash
echo "========= Permission Checker =========="
echo "📄 Enter File Name:"
read FILE

if [ -e "$FILE" ] 
then


if [ -r "$FILE" ] 
then
echo "✅ Readable"
else
echo "❌ Readable"
fi

if [ -w "$FILE" ] 
then
echo "✅ Writable"
else
echo "❌ Writable"
fi

if [ -x "$FILE" ] 
then
echo "✅ Executable"
else
echo "❌ Executable"
fi

echo "Permissions:"
ls -l $FILE

else
echo "❌ File does not exist"
fi