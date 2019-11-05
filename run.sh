#!/usr/bin/env bash

prepare_docker_timezone() {
  # https://www.waysquare.com/how-to-change-docker-timezone/
  MOUNTS+=" --mount type=bind,source=/etc/timezone,target=/etc/timezone,readonly"
  MOUNTS+=" --mount type=bind,source=/etc/localtime,target=/etc/localtime,readonly"
}

prepare_docker_timezone

docker run --rm -it \
  --name "ubuntu-tini" \
  ${MOUNTS} \
  rubensa/ubuntu-tini
