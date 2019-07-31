#!/bin/bash

set -e

build_images() {

	PLATFORM=arm # equivalent to armhf
	DOCKERFILE_LOCATION="./Dockerfile.armhf"
	DOCKER_USER="nico640"
	DOCKER_IMAGE="docker-unms"
	DOCKER_TAG="armhf"

	buildctl build --frontend dockerfile.v0 \
        --frontend-opt platform=linux/${PLATFORM} \
        --frontend-opt filename=./${DOCKERFILE_LOCATION} \
        --exporter image \
        --exporter-opt name=docker.io/${DOCKER_USER}/${IMAGE}:${TAG}-${PLATFORM} \
        --exporter-opt push=true \
        --local dockerfile=. \
        --local context=.
}

build_images