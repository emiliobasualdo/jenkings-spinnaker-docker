set -e

docker build -t ebasualdo/jenkins-docker .
docker push ebasualdo/jenkins-docker:latest
