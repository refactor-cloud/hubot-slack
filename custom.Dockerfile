# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    hubot
# name:     refactorcloud/hubot-slack
# repo:     https://github.com/refactorcloud/hubot-slack
# Requires: node:alpine
# authors:  ranger_huang@yeah.net
# ------------------------------------------------------

FROM minddocdev/hubot

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
