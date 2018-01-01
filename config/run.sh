#!/bin/sh

php-fpm7
nginx

tail -q -F /var/log/nginx/* /var/log/php7/*