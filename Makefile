REPO_NAME=reiniel/jenkins-server
TAG=latest

docker-build:
	@docker build -t ${REPO_NAME}:${TAG} .

docker-push:
	@docker push ${REPO_NAME}:${TAG}

docker-run:
	mkdir -p ~/jenkins_home/ && chmod -R 777 ~/jenkins_home/
	@docker run -u root -d -p 8000:8080 -p 50000:50000 \
	-v ~/jenkins_home/:/var/Jenkins_home/ \
	-v /var/run/docker.sock:/var/run/docker.sock \
	--name Jenkins --restart always \
	${REPO_NAME}:${TAG}