#!/usr/bin/env bash

DOCKER_IMAGE_NAME="ubuntu-tini"

docker rm \
  "${DOCKER_IMAGE_NAME}"
