#
# Made by Ivann LARUELLE / larueli on GitHub and Docker Hub
# kanboard-nonroot on Docker Hub
#
FROM alpine:latest
LABEL maintainer="ivann.laruelle@gmail.com"

EXPOSE 8080 8443
RUN apk --no-cache --update add \
    openssl unzip nginx bash ca-certificates curl ssmtp mailx php7 php7-phar php7-curl \
    php7-fpm php7-json php7-zlib php7-xml php7-dom php7-ctype php7-opcache php7-zip php7-iconv \
    php7-pdo git php7-pdo_mysql php7-pdo_sqlite php7-pdo_pgsql php7-mbstring php7-session php7-bcmath \
    php7-gd php7-mcrypt php7-openssl php7-sockets php7-posix php7-ldap php7-simplexml && \
    rm -rf /var/www/localhost && mkdir /var/www/html

ENV KANBOARD_VERSION v1.2.14
COPY nginx.conf /etc/nginx/nginx.conf
COPY php-fpm.conf /etc/php7/php-fpm.d/www.conf
COPY entrycheck /usr/bin/entrycheck.sh

RUN curl -L -O https://github.com/kanboard/kanboard/archive/${KANBOARD_VERSION}.tar.gz && tar -xf ${KANBOARD_VERSION}.tar.gz --strip 1 -C /var/www/html && rm ${KANBOARD_VERSION}.tar.gz && \
    chgrp -R 0 /var/www && chmod -R g=rwx /var/www && \
    chgrp -R 0 /etc/nginx && chmod -R g=rx /etc/nginx && \
    chgrp -R 0 /etc/php7 && chmod -R g=rx /etc/php7 && \
    chgrp -R 0 /var/cache && chmod -R g=rwx /var/cache && \
    chgrp -R 0 /var/run && chmod -R g=rwx /var/run && \
    chgrp -R 0 /var/log/nginx && chmod -R g=rwx /var/log/nginx && \
    chgrp -R 0 /var/lib/nginx && chmod -R g=rwx /var/lib/nginx && \
    chgrp -R 0 /var/tmp/nginx && chmod -R g=rwx /var/tmp/nginx && \
    mkdir -m 777 /var/www/ssl && chmod 777 /var/www/html/data && chmod 777 /var/www/html/plugins && mkdir -m 777 /var/www/configmap && \
    chmod +x /usr/bin/entrycheck.sh && crond -b

VOLUME /var/www/html/data
VOLUME /var/www/html/plugins
VOLUME /var/www/ssl
#VOLUME /var/www/app/configmap

ENTRYPOINT ["/usr/bin/entrycheck.sh"]
