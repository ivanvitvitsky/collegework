#!/bin/bash
read -p "Введите имя файла: " filename

if [ -f "$filename" ]; then
    lines=$(wc -l < "$filename")
    echo "В файле '$filename' строк: $lines"
else
    echo "Файл '$filename' не найден"
fi
