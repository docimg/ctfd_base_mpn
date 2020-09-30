#!/bin/sh

sed -i 's/register_argc_argv = Off/register_argc_argv = On/g' /usr/local/etc/php/php.ini

# ffi config
apk add libffi-dev
docker-php-ext-configure ffi --with-ffi
docker-php-ext-install ffi
sed -i 's/;ffi.enable=preload/ffi.enable=true/' /usr/local/etc/php/php.ini

echo $FLAG > /flag
chmod 440 /flag
chmod 4555 /readflag

export FLAG=not_here
FLAG=not_here

rm -rf /flag.sh