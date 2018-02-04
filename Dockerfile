FROM ubuntu:16.04

WORKDIR /

RUN apt update -y

RUN apt install -y \
    php\
    php-mbstring\
    php-redis\
    php-mysqli\
    mysql-client\
    nginx\
    supervisor\
    vim

ADD ./data/entirypoint.sh /entrypoint.sh
ADD ./data/nginx /etc/nginx/sites-enabled
ADD ./data/supervisor /etc/supervisor/conf.d/

RUN ls -lah /etc/supervisor

RUN chmod 0777 /entrypoint.sh

CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf --nodaemon