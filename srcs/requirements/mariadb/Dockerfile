FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server curl

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/db.sql /

EXPOSE 3306

RUN service mysql start && mysql < /db.sql
RUN rm -f db.sql

CMD /usr/bin/mysqld_safe
