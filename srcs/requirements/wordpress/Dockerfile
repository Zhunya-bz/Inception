FROM debian:buster

RUN apt update
RUN apt install -y php7.3 php-mysql php-fpm curl sendmail

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools /var/www

# WORDPRESS CONFIGURATION
RUN mkdir /run/php
RUN mkdir -p /var/www/html
# RUN curl -O https://wordpress.org/latest.tar.gz
# RUN tar -xzvf latest.tar.gz -C /var/www/html/
# RUN chmod 777 /var/www/html/wordpress
# WORDPRESS INSTALLATION
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN chmod +x /var/www/start.sh
RUN mv wp-cli.phar /usr/local/bin/wp
# RUN wp core download --allow-root

# static website
# COPY conf/index.html /var/www/index.html

CMD bash /var/www/start.sh
