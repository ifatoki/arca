#!/bin/sh

create_docker_containers() {
  network=$(docker network create arca-network)
  nginx=$(docker run -d -p 80:80 --name arca-nginx --network $network -i nginx)
  mysql=$(docker run -d --name arca-mysql -e MYSQL_ROOT_PASSWORD=isssapassword --network $network -i mysql)
  kibana=$(docker run -d --name arca-kibana --network $network -i kibana:6.4.2)
}

main() {
  create_docker_containers
  echo "nginx container Id: $nginx"
  echo "mysql container Id: $mysql"
  echo "kibana container Id: $kibana"
}

main