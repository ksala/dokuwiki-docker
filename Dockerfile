FROM alpine

ARG DOKUWIKI_VERSION=2017-02-19e
# http://download.dokuwiki.org/src/dokuwiki/dokuwiki-$DOKUWIKI_VERSION.tgz

# Update
RUN apk update && apk upgrade

# Install PHP & nginx
RUN apk add --no-cache php7 php7-fpm php7-session php7-xml php7-openssl php7-zip php7-zlib php7-gd nginx ca-certificates

# Download DokuWiki to /dokuwiki
RUN wget -q -O /tmp/dokuwiki.tgz "https://download.dokuwiki.org/src/dokuwiki/dokuwiki-$DOKUWIKI_VERSION.tgz" && \
    mkdir dokuwiki && \
    tar xvf /tmp/dokuwiki.tgz -C /dokuwiki --strip-components 1 && \
    rm -f /tmp/dokuwiki.tgz && \
    chown nginx:www-data -R /dokuwiki

# Configure PHP
ADD config/fpm.conf /etc/php7/php-fpm.d/doku.conf
RUN rm -f /etc/php7/php-fpm.d/www.conf
RUN mkdir /var/run/php7-fpm/

# Configure nginx
ADD config/nginx.conf /etc/nginx/conf.d/nginx.conf
RUN rm -f /etc/nginx/conf.d/default.conf
RUN mkdir /run/nginx/

# Add entrypoint
ADD config/run.sh /run.sh
RUN chmod +x /run.sh

EXPOSE 80
VOLUME ["/dokuwiki/data", "/dokuwiki/lib/plugins", "/dokuwiki/conf", "/dokuwiki/lib/tpl"]

ENTRYPOINT [ "/run.sh" ]