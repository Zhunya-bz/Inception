#!/bin/bash

set -xve

rm /var/www/html/wordpress/wp-config.php

# подключение к базе данных
wp config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --path="/var/www/html" --allow-root --skip-check

# создаем администратора
wp core install --url="$DOMAIN_NAME" --title="ecole 42" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --path="$WP_PATH" --allow-root

# создаем еще пользователя
wp user create zhenya kanaeva.bz@yandex.ru --role=author --user_pass="zhenya" --allow-root --path="$WP_PATH"

# тема для wordpress
wp theme install inspiro --activate --allow-root

/usr/sbin/php-fpm7.3 -F
