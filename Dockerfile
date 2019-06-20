# Alpine w/ glibc
FROM frolvlad/alpine-glibc

ENV CALIBRE_HOME=/
ENV CALIBRE_CONFIG_DIRECTORY=/tmp
ENV UPDATE_CALIBRE=False
ENV JOBS_FILE=jobs.lst

# Install dependencies and Ruby gems
RUN apk update && \
    apk add --no-cache --upgrade \
	bash unrar curl ruby ruby-dev ca-certificates libc-dev gcc make && \
	gem install -N escape fileutils json maid rake && \
	apk del libc-dev gcc make

# Install Supercronic
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.1.8/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64 \
    SUPERCRONIC_SHA1SUM=be43e64c45acd6ec4fce5831e03759c89676a0ea

RUN curl -fsSLO "$SUPERCRONIC_URL" && \
	echo "${SUPERCRONIC_SHA1SUM}  ${SUPERCRONIC}" | sha1sum -c - && \
	chmod a+x "$SUPERCRONIC" && \
	mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" && \
	ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic

# Scripts
WORKDIR /etc/maid/
ADD maid/ /etc/maid/
RUN chmod 755 *.sh

# Bootstrap
CMD ./run.sh
