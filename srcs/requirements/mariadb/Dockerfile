FROM debian:buster

RUN apt update
RUN apt install -y mariadb-server curl

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/* /tmp/

EXPOSE 3306

CMD bash /tmp/start.sh
