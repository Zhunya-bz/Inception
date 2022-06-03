#!/bin/bash
cd /var/www/html
wp core download --allow-root
# подключение к базе данных
# wp config create --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --path="/var/www/wordpress" --allow-root --skip-check

# замена текста в конфиге на переменные среды
sed -i -e "s/\${DB_NAME}/${DB_NAME}/g" /var/www/wp-config.php
sed -i -e "s/\${MYSQL_USER}/${MYSQL_USER}/g" /var/www/wp-config.php
sed -i -e "s/\${MYSQL_PASSWORD}/${MYSQL_PASSWORD}/g" /var/www/wp-config.php
sed -i -e "s/\${DB_HOST}/${DB_HOST}/g" /var/www/wp-config.php

mv /var/www/wp-config.php /var/www/html/wp-config.php
chown -R www-data:www-data /var/www/*
chown -R 755 /var/www/*
# создаем администратора
wp core install --url="$DOMAIN_NAME" --title="ecole 42" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASSWORD" --admin_email="$WP_ADMIN_EMAIL" --path="$WP_PATH" --allow-root

# создаем еще пользователя
wp user create "$MYSQL_USER" kanaeva.bz@yandex.ru --role=author --user_pass="$MYSQL_PASSWORD" --allow-root --path="$WP_PATH"

# тема для wordpress
# wp theme install inspiro --activate --allow-root

/usr/sbin/php-fpm7.3 -F
