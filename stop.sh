#!/usr/bin/env bash

DOCKER_IMAGE_NAME="ubuntu-tini"

docker stop  \
  "${DOCKER_IMAGE_NAME}"
