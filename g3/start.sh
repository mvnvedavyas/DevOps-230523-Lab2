docker build -t g3image .

echo -e "\n> STOPPING AND REMOVING RPEVIOUS RUNNING CONTAINERS!!\n"
docker container stop g3container
docker container rm g3container

docker run --name=g3container --read-only g3image


# Tasks
# 1- Makes sure the app.py runs when you start the container.
# 2- The container is running as the non-root user.
# 3- Show me that the file system is read-only.
# 4- Test if the pandas present in the container.