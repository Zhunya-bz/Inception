FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server curl

#RUN service mysql start && \
#    mysql -e "CREATE DATABASE ${DB_NAME}; \
#    GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'; \
#    FLUSH PRIVILEGES;"

#RUN apt-get install procps -yq

#RUN mkdir /run/mysqld
#RUN chown mysql /run/mysqld
#RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/* /tmp/

RUN chmod +x /tmp/start.sh

EXPOSE 3306

CMD bash /tmp/start.sh
