# syntax=docker/dockerfile:1.4
# Ubuntu 24.04 LTS (Noble Numbat) Release Build
FROM ubuntu:noble
LABEL author="Ruben Suarez <rubensa@gmail.com>"

# Architecture component of TARGETPLATFORM (platform of the build result)
ARG TARGETARCH

# Tini version to install (https://github.com/krallin/tini/releases)
ARG TINI_VERSION=v0.19.0

# Add Tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-${TARGETARCH} /sbin/tini
RUN <<EOT
chown root:root /sbin/tini
chmod 4755 /sbin/tini
EOT

# Execute the init command
ENTRYPOINT [ "/sbin/tini", "--" ]

# Run bash under Tini
CMD [ "/bin/bash" ]
