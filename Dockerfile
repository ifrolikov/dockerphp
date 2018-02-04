FROM ubuntu:17.10

WORKDIR /

RUN apt update -y

RUN apt purge -y apache*

RUN apt install -y \
    php\
    php-mbstring\
    php-redis\
    php-mysqli\
    php-dom\
    mysql-client\
    nginx\
    supervisor\
    composer\
    vim

ADD ./data/entirypoint.sh /entrypoint.sh
ADD ./data/nginx /etc/nginx/sites-enabled
ADD ./data/supervisor /etc/supervisor/conf.d/

RUN ls -lah /etc/supervisor

RUN chmod 0777 /entrypoint.sh

CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf --nodaemon