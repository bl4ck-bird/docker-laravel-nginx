# Nginx Docker image for Laravel

![build](https://github.com/bl4ck-bird/docker-laravel-nginx/workflows/build/badge.svg?branch=master&event=workflow_dispatch)

Docker image for a nginx container crafted to run Laravel based applications.

## Usage

### Start with docker-compose

```yml
version: '3'

services:
  nginx:
    image: flrnrud7/laravel-nginx:latest
    ports:
      - "80:80"
    depends_on:
      - php-fpm
    volumes:
      - .:/usr/share/nginx/html:cached

  php-fpm:
    image: flrnrud7/laravel-php-fpm:latest
    volumes:
      - .:/var/www/html:cached
```

## Environment Variables

| Name | Description | Default value |
| ---- | ----------- | ------- |
| `TZ` | OS timezone | `UTC` |
| `NGINX_HOST` | `server_name` on `conf.d/default.conf` | `localhost` |
| `NGINX_GZIP` | `gzip` on `conf.d/default.conf` | `on` |
| `NGINX_GZIP_MIN_LENGTH` | `gzip_min_length` on `conf.d/default.conf` | `10240` |
| `NGINX_FASTCGI_HOST` | Host of `fastcgi_pass` on `conf.d/default.conf` | `php-fpm` |
| `NGINX_FASTCGI_PORT` | Port of `fastcgi_pass` on `conf.d/default.conf` | `9000` |
