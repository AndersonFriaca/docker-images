#!/bin/bash

set -e

echo "Instalando Xdebug..."
yum install -y php-pecl-xdebug
touch /etc/php.d/15-xdebug-remote.ini
echo "xdebug.remote_enable=1" >> /etc/php.d/15-xdebug-remote.ini
echo "xdebug.remote_autostart=1" >> /etc/php.d/15-xdebug-remote.ini
echo "xdebug.remote_port=$XDEBUG_PORT" >> /etc/php.d/15-xdebug-remote.ini
echo "xdebug.handler=dbgp" >> /etc/php.d/15-xdebug-remote.ini
echo "xdebug.remote_connect_back=1" >> /etc/php.d/15-xdebug-remote.ini
echo "xdebug.show_local_vars=1" >> /etc/php.d/15-xdebug-remote.ini
echo "xdebug.idekey=$XDEBUG_KEY" >> /etc/php.d/15-xdebug-remote.ini
echo "xdebug.remote_log=/$XDEBUG_LOG_FILE" >> /etc/php.d/15-xdebug-remote.ini
touch $XDEBUG_LOG_FILE
chmod 666 $XDEBUG_LOG_FILE
