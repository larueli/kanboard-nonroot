#
# Made by Ivann LARUELLE / larueli on GitHub and Docker Hub
# kanboard-nonroot on Docker Hub
#
FROM larueli/php-base-image:7.4
LABEL maintainer="ivann.laruelle@gmail.com"

USER 0

ARG KANBOARD_VERSION=1.2.18
ENV KANBOARD_VERSION=${KANBOARD_VERSION}

RUN cd /tmp && wget https://github.com/kanboard/kanboard/archive/refs/tags/v${KANBOARD_VERSION}.zip && unzip v${KANBOARD_VERSION}.zip && rm -rf v${KANBOARD_VERSION}.zip && \
    rm -rf /var/www/html && mv kanboard-${KANBOARD_VERSION} /var/www/html && \
    chgrp -R 0 /var/www/html && chmod -R g=rwx /var/www/html

USER 451541:0

VOLUME /var/www/html/data
VOLUME /var/www/html/plugins
