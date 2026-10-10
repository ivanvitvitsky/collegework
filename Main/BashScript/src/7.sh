#!/bin/bash

# Процесс запуска: bash 8.sh username/repository

repo=$1

if [ -z "$repo" ]; then
    echo "Укажите репозиторий, например: bash 8.sh alexrezchikov/alexrezchikov"
    exit 1
fi

data=$(curl -s "https://api.github.com/repos/$repo")

if [ -z "$data" ]; then
    echo "Нет интернета"
    exit 1
fi

if echo "$data" | grep -q '"message": "Not Found"'; then
    echo "Репозиторий $repo не найден"
    exit 1
fi

if echo "$data" | grep -q "rate limit"; then
    echo "Превышен лимит запросов, попробуйте позже"
    exit 1
fi

stars=$(echo "$data" | grep -m1 '"stargazers_count"' | tr -dc '0-9')
forks=$(echo "$data" | grep -m1 '"forks_count"' | tr -dc '0-9')
issues=$(echo "$data" | grep -m1 '"open_issues_count"' | tr -dc '0-9')

YELLOW='\033[33m'
GREEN='\033[32m'
RED='\033[31m'
NC='\033[0m'

echo "Репозиторий: $repo"
echo -e "Звёзды: ${YELLOW}$stars${NC}"
echo -e "Форки: ${GREEN}$forks${NC}"

if [ "$issues" -gt 100 ]; then
    echo -e "Issues: ${RED}$issues${NC}"
else
    echo -e "Issues: ${YELLOW}$issues${NC}"
fi