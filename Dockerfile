# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    hubot
# name:     minddocdev/hubot
# repo:     https://github.com/mind-doc/hubot
# Requires: node:alpine
# authors:  development@minddoc.com
# ------------------------------------------------------

ARG HUBOT_VERSION="3.3.2"
FROM minddocdev/hubot:$HUBOT_VERSION

LABEL maintainer="ranger_huang@yeah.net"

USER root
# add time
ARG TIME_ZONE="Asia/Shanghai"
ENV TIME_ZONE=$TIME_ZONE
RUN apk update \
    && apk add tzdata \
    && cp /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime \
    && echo "$TIME_ZONE" > /etc/timezone \
    && apk del tzdata \
    && rm -rf /var/cache/apk/*

USER hubot
