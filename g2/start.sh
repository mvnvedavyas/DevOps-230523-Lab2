#!/bin/bash

docker container rm g2container
docker run -itd --name g2container -v g2vol:/container/data ubuntu
docker cp script.sh g2container:/root/script.sh

# This script creates a file at /container/data/g2file.txt
docker exec -itd g2container /bin/bash /root/script.sh

sleep 1

echo -e "\n\nBEFORE DELETING THE CONTAINER!!!!!!!!!!"
cat "$(docker volume inspect --format '{{ .Mountpoint }}' g2vol)/g2file.txt"

echo -e "\nDELETING THE CONTAINER NOW..."
docker rm -f g2container

echo -e "\nAFTER DELETING THE CONTAINER THE FILE STIL PRESISTS!!!!"
echo -e "\n$(docker volume inspect --format '{{ .Mountpoint }}' g2vol)"

echo -e "\n> ls -l path_to_volume_data"
ls -l $(docker volume inspect --format '{{ .Mountpoint }}' g2vol)

echo -e "\n> File contents:"
cat "$(docker volume inspect --format '{{ .Mountpoint }}' g2vol)/g2file.txt"