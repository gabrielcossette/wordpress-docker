#!/bin/bash

wget https://raw.githubusercontent.com/docker-library/wordpress/master/php7.2/fpm-alpine/docker-entrypoint.sh -O docker-entrypoint.sh

diff -Naur docker-entrypoint.sh entrypoint_modif > entrypoint.patch
