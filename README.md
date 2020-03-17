# jenkins-docker-image
Project for creating jenkins docker images based on [jenkins official docker image](https://hub.docker.com/r/jenkins/jenkins/tags?page=1&name=2.225-alpine) 
with default admin user, avoiding configuration steps and some pre-installed plugins.

## Links
- [github](https://github.com/c-sols/jenkins-docker-image)
- [dockerhub](https://hub.docker.com/repository/docker/csolutions/jenkins)

## How to use it?
```
mkdir -p ~/jenkins_home/ && chmod -R 777 ~/jenkins_home/
@docker run -u root -d -p 80:8080 -p 50000:50000 \
-v ~/jenkins_home/:/var/Jenkins_home/ \
-v /var/run/docker.sock:/var/run/docker.sock \
--name Jenkins --restart always \
csolutions/jenkins:latest
```