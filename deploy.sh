aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 092101872227.dkr.ecr.ap-southeast-1.amazonaws.com

docker pull 092101872227.dkr.ecr.ap-southeast-1.amazonaws.com/docker-automation:$1
echo "docker pull succeeded"

docker ps -a
echo "previous commands shows if existing docker is present or not"

docker rm -f dotnet-app
echo "delete the container "

docker ps -a
echo "empty docker"

docker run -itd -p 3000:3000 --name dotnet-app 092101872227.dkr.ecr.ap-southeast-1.amazonaws.com/docker-automation:$1

docker ps -a
echo "docker container deployed successfully"
