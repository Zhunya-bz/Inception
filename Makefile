all:
	sudo docker-compose -f srcs/docker-compose.yml up
clean:
	sudo docker-compose -f srcs/docker-compose.yml down -v
fclean: clean
	sudo docker stop $$(docker ps -qa)
	sudo docker rm $$(docker ps -qa)
	sudo docker rmi -f $$(docker images -qa)
	sudo docker volume rm $$(docker volume ls -q)
	sudo docker network rm $$(docker network ls -q)
re:	
	sudo docker-compose -f srcs/docker-compose.yml up --build
