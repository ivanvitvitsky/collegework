## Adminer (альтернатива phpMyAdmin)

Запуск Adminer для управления БД

Выполните все этапы работы с проектом по примеру с [Nginx](/content/Docker/ImageLibrary/Nginx.md)

> Никогда в разработке не используйте русские имена файлов и каталогов!

> Никогда в разработке не используйте пробелы и спец.символы в именах файлов и каталогов!

> Перед созданием проекта убедитесь, что порт 8084 не занят другим приложением!

> Создание проекта лучше начать с "чистого листа", предварительно остановив и удалив все другие контейнеры и образы!


Запустите **Adminer** в **Windows Powershell**
```shell
docker run -d `
  --name adminer `
  -p 8084:8080 `
  adminer:latest
```
![1](/mfuawork/2_DB&OS/Docker/Adminer/1.png)


Запустите **Adminer** в **Git-Bash/Linux/WSL 2.0/Mac**
```shell
docker run -d \
  --name adminer \
  -p 8084:8080 \
  adminer:latest
```
![2](/mfuawork/2_DB&OS/Docker/Adminer/2.png)

[Откройте: http://localhost:8084](http://localhost:8084)

![3](/mfuawork/2_DB&OS/Docker/Adminer/3.png)


При необходимости можно из этого же образа создать ещё один контейнер:
```shell
docker run -d \
  --name adminer_2 \
  -p 8085:8080 \
  adminer:latest
```
[Откройте: http://localhost:8085](http://localhost:8085)


> Без отдельно запущенного контейнера с БД PostgreSQL и связи с ним админ-панель работаеть не будет!

> Заполнять данные админ-панели не нужно!

Система:
- PostgreSQL
- сервер: host.docker.internal
- логин: postgres
- пароль: mysecretpassword

> Если вы обнаружили ошибку в этом тексте - сообщите пожалуйста автору!