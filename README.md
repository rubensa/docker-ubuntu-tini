# Docker image based on ubuntu and running tini init system

This is a Docker image based on [ubuntu](https://hub.docker.com/_/ubuntu/) running [tini](https://github.com/krallin/tini) init system inside a container.

## Building

You can build the image like this:

```
#!/usr/bin/env bash

docker build --no-cache \
	-t "rubensa/ubuntu-tini" \
	--label "maintainer=Ruben Suarez <rubensa@gmail.com>" \
	.
```

## Running

You can run the container like this (change --rm with -d if you don't want the container to be removed on stop):

```
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
```

## Connect

You can connect to the running container like this:

```
#!/usr/bin/env bash

docker exec -it \
  ubuntu-tini \
  bash -l
```

## Stop

You can stop the running container like this:

```
#!/usr/bin/env bash

docker stop \
  ubuntu-tini
```

## Start

If you run the container without --rm you can start it again like this:

```
#!/usr/bin/env bash

docker start \
  ubuntu-tini
```

## Remove

If you run the container without --rm you can remove once stopped like this:

```
#!/usr/bin/env bash

docker rm \
  ubuntu-tini
```
