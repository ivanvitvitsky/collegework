#!/bin/bash
read -p "Введите расширение (например txt): " ext

echo "Найденные файлы:"
ls *.$ext 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Файлов с расширением .$ext нет"
fi
