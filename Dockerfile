FROM ubuntu:17.10

WORKDIR /

RUN apt update -y

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
    curl\
    vim

RUN apt purge -y apache*
RUN rm -rf /etc/nginx/sites-enabled/*

ADD ./data/nginx /etc/nginx/sites-enabled
ADD ./data/supervisor /etc/supervisor/conf.d/

RUN ls -lah /etc/supervisor

CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf --nodaemon