#!/usr/bin/env bash

docker build --no-cache \
	-t "rubensa/ubuntu-tini" \
	--label "maintainer=Ruben Suarez <rubensa@gmail.com>" \
	.
