workspace=$(shell pwd)
REPO_NAME=csolutions/jenkins
TAG=latest

docker-build:
	@docker build -t ${REPO_NAME}:${TAG} ./jenkins

docker-push:
	@docker push ${REPO_NAME}:${TAG}

docker-run:
	@docker run -d -p 80:8080 -p 50000:50000 \
	-v $(which docker):/usr/bin/docker \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v csolutions_jenkins_data:/var/jenkins_home \
	--name csolutions-ci --restart always \
	${REPO_NAME}:${TAG}

docker-kill:
	@docker rm -f $$(docker ps -qa --filter name=csolutions-ci)
