# nginx-rtmp-hls-docker by Liksa | GarageTesla

Минимальные требования 
`` Linux ``
`` Ubuntu 18.04 / Debian 10 ``
`` 4 гб озу ``
`` 60 гб HDD SPACE ``

### Подготовка системы


Подготовка системы 
``sudo apt-get update``
``sudo apt-get upgrade -y``
``sudo apt-get install docker.io -y``
``sudo apt-get install docker-composer -y``

#Редакторы для удобности
```sudo apt-get install nano -y```
|Использование - nano файл 
Чтобы сохранить CTRL+O
Чтобы найти в документе CTRL+W
Чтобы выйти CTRL+C или CTRL+Z 

#Просмотр нагрузки системы через консоль
``sudo apt-get htop -y``
|Использование = htop



###Перед сборкой докера 

Перейдите пожалуйста в папку html 
``cd html``

Вам необходимо указать ваши ключи , для трасляции
И сделать копии страниц для количесва камер .

ПАРОЛЬ ДЛЯ ВХОДА НА СТРАНИЦУ (Минимальная защита - очень минимальная)
gt123456

Для редактирования файлов и перемещение между каталогами рекомендую использовать
``WinScp``
https://winscp.net/eng/download.php


###Сборка и запуск контейнера docker
! Чтобы не открывать лишний раз файл через nano используй !-  cat README.md

1.Необходимо собрать контейнер и
!!!Пометка!!! в конце команды должна быть точка !!!
  
``docker build -t nginx-rtmp-hls .``


#После успешной сборки , это занимает некоторое время.


2. Запусти контейнер  
!!!!Пометка!!! В случае если вам необходимо изменить порты , редактируйте файле nginx.conf 
!!!! После сменны обязательно укажите такие же порты при выполнении команды!!!

``docker run -d -p 80:80 -p 1935:1935 nginx-rtmp-hls``

3. Чтобы удостовериться , что контейнер работает используйте команду 
``docker ps``

Эта комадна показывает всю информацию и так же id контейнера , который нам в дальнейшем пригодится. 


4. Запусти трансляцию через  [OBS](https://obsproject.com)  
Установи в настройках трансляции в линке 
``rtmp://0.0.0.0:1935/live`` 
"URL"  
и ``yourkeyenglishlanguage`` в "Скекретном ключе".

5. Подожди 45 секунд и радуйся , что у вас есть стрим :)

6. Открой браузер с вашим IP:  
http://ВАЩIP/

или открой в удобном проигрователе и передайте URL загрузки:  
http://ВАЩIPадресс/hls/test.m3u8

#Как скопировать видео себе на сервер
Выполните команду

``docker ps`` 
``docker cp idconteinter:/tmp/videos/ /root/video``

Чтобы узнать путь на своей хост машине выполните 
``pwd``

#Перезапуск контейнера или остановка или удаление его
``docker restart idconteiner`` - перезапустить
``docker stop idconteiner`` - остановить
``docker rm idconteiner`` - остановить



