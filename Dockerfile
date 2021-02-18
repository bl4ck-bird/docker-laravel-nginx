ARG NGINX_VERSION

FROM nginx:${NGINX_VERSION}-alpine

LABEL maintainer="bl4ckbird <bl4ckbird@bl4ckbird.com>"

ENV TZ="UTC"

RUN cd /usr/share/nginx/html; \
    mkdir public; \
    mv index.html public/; \
    rm -f 50x.html \
    mkdir /etc/nginx/templates

COPY templates/* /etc/nginx/templates/

ENV NGINX_HOST="localhost" \
    NGINX_GZIP="on" \
    NGINX_GZIP_MIN_LENGTH="10240" \
    NGINX_FASTCGI_HOST="php-fpm" \
    NGINX_FASTCGI_PORT="9000"
