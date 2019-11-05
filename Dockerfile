FROM ubuntu
LABEL author="Ruben Suarez <rubensa@gmail.com>"

# Add Tini
ADD https://github.com/krallin/tini/releases/latest/download/tini /sbin/tini
RUN chmod +x /sbin/tini

# Execute the init command
ENTRYPOINT [ "/sbin/tini", "--" ]

CMD [ "/bin/bash" ]
