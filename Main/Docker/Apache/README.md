## Apache

> Никогда в разработке не используйте русские имена файлов и каталогов!

> Никогда в разработке не используйте пробелы и спец.символы в именах файлов и каталогов!

> Создание проекта лучше начать с "чистого листа", предварительно остановив и удалив все другие контейнеры и образы!

Выполните все этапы работы с проектом по примеру с [Nginx](/content/Docker/ImageLibrary/Nginx.md)

Получить образ, создать и запустить контейнер:
```shell
docker run -d --name my-apache -p 8081:80 httpd
```
![1](/mfuawork/2_DB&OS/Docker/Apache/1.png)



[Откройте адрес http://localhost:8081 в браузере](http://localhost:8081)
![2](/mfuawork/2_DB&OS/Docker/Apache/2.png)


### Редактирование веб-страницы

Зайти в контейнер
```shell
docker exec -it my-apache bash
```
![3](/mfuawork/2_DB&OS/Docker/Apache/3.png)

Установить текстовый редактор командной строки Micro:
```shell
apt update && apt install -y micro
```
![4](/mfuawork/2_DB&OS/Docker/Apache/4.png)


Открыть файл `index.html` для редактирования содержимого
```shell
micro /usr/local/apache2/htdocs/index.html
```

> Чтобы в веб-странице поддерживался русский язык, вставьте тэг `<meta charset="UTF-8">`

отредайтируйте и сохраните по `Ctrl+S` и выйти из режима редактирования по `Ctrl+Q` или `F10`

[Проверьте результат по адрес http://localhost:8081](http://localhost:8081)

![5](/mfuawork/2_DB&OS/Docker/Apache/5.png)

Выйти из контейнера:
```shell
exit
```

> Если вы обнаружили ошибку в этом тексте - сообщите пожалуйста автору!