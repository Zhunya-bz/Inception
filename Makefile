all:
	docker-compose -f srcs/docker-compose.yml up
clean:
	docker-compose -f srcs/docker-compose.yml down
fclean: clean
	docker stop $(docker ps -qa)
	docker rm $(docker ps -qa)
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q)
re:	
	docker-compose -f srsc/docker-compose.yml up --build
