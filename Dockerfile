FROM tiangolo/nginx-rtmp:latest


MAINTAINER Laletin Egor  <laletinegor02@gmail.com>
ENV LANG C.UTF-8
ENV TZ=Asia/Novosibirsk

run echo "Установил часов пояс на Asia/Novosibirsk"

run apt update 2>/dev/null | grep packages | cut -d '.' -f 1
run  apt-get -s upgrade | grep -P "\d\K upgraded"
run apt install ffmpeg -y
run apt install htop -y
run apt install nano -y 
run mkdir /tmp/videos
run chown -R nobody:nogroup /tmp/videos
run chmod -R 700 /tmp/videos
COPY nginx.conf /etc/nginx/nginx.conf
COPY html /usr/local/nginx/html/


EXPOSE 80 1935

CMD ["nginx", "-g", "daemon off;"]
run echo "Успешно собрал контейнер"
