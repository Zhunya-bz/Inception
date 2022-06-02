chown -R mysql:mysql /var/lib/mysql
service mysql start
sleep 3
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;"| mysql -u root
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"| mysql -u root
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"| mysql -u root
echo "FLUSH PRIVILEGES;"| mysql -u root
# mysqladmin -u root password $MYSQL_ROOT_PASSWORD
service mysql stop

mysqld
