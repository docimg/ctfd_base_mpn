FROM php:7.4.10-fpm-alpine

LABEL Organization="docimg" Author="hdxw <909712710@qq.com>"
LABEL maintainer="909712710@qq.com"

COPY _files /tmp

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --update --no-cache nginx mysql mysql-client \
    # mysql ext
    && docker-php-source extract \
    && docker-php-ext-install pdo_mysql mysqli \
    && docker-php-source delete \
    # config mysql
    && mv /tmp/my.cnf /etc/ \
    # config php.ini
    && cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    # config nginx.conf
    && mv /tmp/default.conf /etc/nginx/conf.d/ \
    && mkdir /run/nginx/ \
    # config entrypoint
    && mv /tmp/docker-php-entrypoint /usr/local/bin/docker-php-entrypoint \
    && chmod +x /usr/local/bin/docker-php-entrypoint \
    && echo '<?php phpinfo();' > /var/www/html/index.php

WORKDIR /var/www/html
EXPOSE 80
ENTRYPOINT ["docker-php-entrypoint"]