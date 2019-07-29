FROM	centos:7

LABEL 	maintainer="https://github.com/AndersonFriaca"

ARG	INSTALL_XDEBUG=no

ARG	XDEBUG_PORT=9000

ARG	XDEBUG_KEY=DEBUG

ARG	XDEBUG_LOG_FILE=/var/log/xdebug.log

RUN     yum makecache fast && \
        yum -y --setopt=tsflags=nodocs update && \
        yum -y install vim \
	wget \
        epel-release \
        libaio \
        http://rpms.remirepo.net/enterprise/remi-release-7.rpm
        
RUN     yum-config-manager --enable remi-php71 && \
        yum install -y php-fpm \
        php-cli \
        php-bcmath \
        php-intl \
        php-mbstring \
        php-gd \
        php-imap \
        php-xml \
        php-soap \
        php-opcache \
        php-redis \
        php-pdo \
        php-odbc \
        php-mysql \
        php-pgsql \
	php-pecl-zip \
	php-ldap \
        yum clean all

WORKDIR /var/www/html/

RUN	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY	./scripts/ /usr/sbin/scripts

RUN	chmod -R +x /usr/sbin/scripts && \
	/usr/sbin/scripts/additionals/install-additionals.sh

RUN     mkdir /run/php-fpm && \
        rm /etc/php-fpm.d/www.conf     

ADD     ./php.conf/php-fpm.d/www.conf /etc/php-fpm.d/

EXPOSE  9000

CMD	["php-fpm", "-F"]
