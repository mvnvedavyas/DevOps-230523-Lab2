docker build -t g4image .

echo -e "\n\n> REMOVING PREVIOUS DOCKER CONTAINERS!"
docker container stop g4container
docker container rm g4container

echo -e "\n\n> RUNNING DOCKER IMAGE!"
docker run --name=g4container g4image

echo -e "\n\n> docker pull apline image for comparing"
docker pull alpine:latest

echo -e "\n\n> docker images"
docker images