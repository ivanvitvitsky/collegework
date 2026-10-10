# Bash scripting

Самостоятельная работа по Bash-программированию.
Выполнено в VS Code + Git-Bash. Все скрипты лежат в папке [`src`](src/).

## Скрипты

| Файл | Описание |
|------|----------|
| `1.sh` | Приветствие |
| `2.sh` | Сумма двух чисел |
| `3.sh` | Проверка на чётность |
| `4.sh` | Структура веб-проекта |
| `5.sh` | Подсчёт строк в файле |
| `6.sh` | Генератор пароля |
| `7.sh` | Поиск файлов по расширению |
| `8.sh` | GitHub Repository Analyzer |

## Запуск

```bash
cd bashScripting
bash 1.sh
```

Остальные скрипты запускаются так же: `bash 2.sh`, `bash 3.sh` и т.д.
Для `8.sh` нужно указать репозиторий:

```bash
bash 8.sh torvalds/linux
```

***

## Выполненные задания

### 1. Приветствие

Скрипт спрашивает имя и здоровается.

```bash
#!/bin/bash
echo "Как вас зовут?"
read name
echo "Привет, $name!"
```

Скриншот вывода:

![1](img/1.png)

### 2. Сумма двух чисел

Скрипт просит ввести два числа и выводит их сумму.

```bash
#!/bin/bash
read -p "Введите первое число: " a
read -p "Введите второе число: " b
sum=$((a + b))
echo "Сумма: $sum"
```

Скриншот вывода:

![2](img/2.png)

### 3. Проверка на чётность

Скрипт проверяет, чётное число или нет.

```bash
#!/bin/bash
read -p "Введите число: " num

if [ $((num % 2)) -eq 0 ]; then
    echo "Число $num чётное"
else
    echo "Число $num нечётное"
fi
```

Скриншот вывода:

![3](img/3.png)

### 4. Подсчёт строк в файле

Скрипт считает, сколько строк в файле.

```bash
#!/bin/bash
read -p "Введите имя файла: " filename

if [ -f "$filename" ]; then
    lines=$(wc -l < "$filename")
    echo "В файле '$filename' строк: $lines"
else
    echo "Файл '$filename' не найден"
fi
```

Скриншот вывода:

![4](img/4.png)

### 5. Генератор пароля

Скрипт создаёт случайный пароль из 8 символов.

```bash
#!/bin/bash
password=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 8)
echo "Ваш пароль: $password"
```

Скриншот вывода:

![5](img/5.png)

### 6. Поиск файлов по расширению

Скрипт ищет в текущей папке файлы с нужным расширением.

```bash
#!/bin/bash
read -p "Введите расширение (например txt): " ext

echo "Найденные файлы:"
ls *.$ext 2>/dev/null

if [ $? -ne 0 ]; then
    echo "Файлов с расширением .$ext нет"
fi
```

Скриншот вывода:

![6](img/6.png)

### 7. GitHub Repository Analyzer

Скрипт показывает звёзды, форки и issues репозитория через GitHub API. Нужен `curl`.

```bash
#!/bin/bash

# Запуск: bash 8.sh alexrezchikov/alexrezchikov

repo=$1

if [ -z "$repo" ]; then
    echo "Укажите репозиторий, например: bash 8.sh torvalds/linux"
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
```

Скриншот вывода:

![7](img/7.png)

***

## Вывод

Я научился писать простые скрипты на Bash: вводить данные через `read`, использовать переменные, условия `if` и команды вроде `mkdir`, `wc`, `tr` и `curl`.
