FROM ubuntu
LABEL author="Ruben Suarez <rubensa@gmail.com>"

ARG TINI_VERSION=v0.19.0

# Add Tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/tini
RUN chown root:root /sbin/tini \
    && chmod 4755 /sbin/tini

# Execute the init command
ENTRYPOINT [ "/sbin/tini", "--" ]

# Run bash under Tini
CMD [ "/bin/bash" ]
