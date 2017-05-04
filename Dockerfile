FROM lsiobase/alpine.nginx.arm64
MAINTAINER sparklyballs

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install packages
RUN \
 apk add --no-cache \
	curl \
	tar && \
 apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/main \
	libwebp \
	icu-libs && \
 apk add --no-cache \
	--repository http://nl.alpinelinux.org/alpine/edge/community \
	php7-apcu \
	php7-curl \
	php7-dom \
	php7-gd \
	php7-iconv \
	php7-intl \
	php7-json \
	php7-mcrypt \
	php7-mysqli \
	php7-mysqlnd \
	php7-pcntl \
	php7-pdo_mysql \
	php7-pdo_pgsql \
	php7-pgsql \
	php7-posix && \

# link php7 to php, fix update daemon
 ln -sf /usr/bin/php7 /usr/bin/php

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 80 443
VOLUME /config
