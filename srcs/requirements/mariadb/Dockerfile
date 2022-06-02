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
# RUN chown mysql:mysql /var/lib/mysqld

EXPOSE 3306
# ENTRYPOINT ["bash"] 
# CMD [ "-c", "sleep 10000"]
CMD bash /tmp/start.sh

#  mysql_install_db --datadir=/var/lib/mysql	--auth-root-authentication-method=normal

# FROM	alpine:3.15

# RUN		apk update && apk add --no-cache --quiet --update mariadb mariadb-client

# RUN		mkdir -p /var/lib/mysqld /run/mysqld
# COPY	./create_db.sql /tmp/create_db.sql
# COPY	./setup.sh ./

# RUN		mariadb-install-db --datadir=/var/lib/mysql \
# 			--auth-root-authentication-method=normal
# RUN		chown -R mysql:mysql /var/lib/mysql /run/mysqld

# ENTRYPOINT [ "sh", "setup.sh" ]