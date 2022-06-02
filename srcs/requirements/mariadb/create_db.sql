DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');


--  set root pwd
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD');

--  create wordpress assets
CREATE DATABASE $DB_NAME;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED by '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO $MYSQL_USER@'%';

--  take effects
FLUSH PRIVILEGES;
