FROM debian:buster

RUN apt update
RUN apt install -y nginx openssl

EXPOSE 443

COPY ./conf/my_conf /etc/nginx/sites-available/
COPY ./tools/start.sh /var/www/

CMD bash /var/www/start.sh

