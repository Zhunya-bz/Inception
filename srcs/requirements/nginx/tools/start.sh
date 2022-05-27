if [ ! -f /etc/ssl/certs/nginx.crt ]; then
echo "Nginx: setting up ssl ...";
openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=wordpress/CN=saltmer.42.fr";
echo "Nginx: ssl is set up!";
fi

# Run nginx
# Nginx использует daemon off директиву для запуска на переднем плане
nginx -g 'daemon off;';
