FROM wordpress:php7.2-fpm-alpine

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

RUN head -n -1 /usr/local/bin/docker-entrypoint.sh > /usr/local/bin/docker-entrypoint-temp.sh && \
mv /usr/local/bin/docker-entrypoint-temp.sh /usr/local/bin/docker-entrypoint.sh && \
chmod +x /usr/local/bin/docker-entrypoint.sh

RUN { \
    echo 'if ! [ -d wp-content/plugins/wp-clone-by-wp-academy ]; then'; \
    echo 'cd /var/www/html/wp-content/plugins/ && wget http://downloads.wordpress.org/plugin/wp-clone-by-wp-academy.latest-stable.zip && unzip *.zip && rm *.zip'; \
    echo 'fi'; \
    echo 'if ! [ -d wp-content/plugins/nginx-helper ]; then'; \
    echo 'cd /var/www/html/wp-content/plugins/ && wget http://downloads.wordpress.org/plugin/nginx-helper.latest-stable.zip && unzip *.zip && rm *.zip'; \
    echo 'fi'; \
    echo 'if ! [ -d wp-content/plugins/redis-cache ]; then'; \
    echo 'cd /var/www/html/wp-content/plugins/ && wget http://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip && unzip *.zip && rm *.zip'; \
    echo 'fi'; \
    echo 'exec "$@"'; \
    } >> /usr/local/bin/docker-entrypoint.sh
