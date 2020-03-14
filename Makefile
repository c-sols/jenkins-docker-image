workspace=$(shell pwd)

include makefiles/Makefile.docker
include makefiles/Makefile.aws

REPO_NAME=reiniel/jenkins
TAG=latest