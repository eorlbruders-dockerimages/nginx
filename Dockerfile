FROM registry.eorlbruder.de/cron
MAINTAINER  David Magnus Henriques <eorlbruder@magnus-henriques.de>

RUN pacman -Syyu --noconfirm --quiet --needed nginx && \
    pacman -Sc --noconfirm

ADD assets/ /

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443


CMD ["supervisord", "-n"]
