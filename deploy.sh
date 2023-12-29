aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 440038317783.dkr.ecr.us-east-1.amazonaws.com

docker pull 440038317783.dkr.ecr.us-east-1.amazonaws.com/manual_docker_project:$1
echo "docker pull succeeded"

docker ps -a
echo "This commands shows if existing docker is present or not"

docker rm -f dotnet-app
echo "delete the container "

docker ps -a
echo "empty docker"

docker run -itd -p 3000:3000 --name dotnet-app 440038317783.dkr.ecr.us-east-1.amazonaws.com/manual_docker_project:$1

docker ps -a
echo "docker container deployed successfully"
