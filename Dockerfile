FROM armhf/alpine

LABEL maintainer="Sean Staley <sean.staley@gmail.com>"

# Install pygments (for syntax highlighting) and bash
RUN apk update && apk add py-pygments bash tar && rm -rf /var/cache/apk/*

ENV HUGO_VERSION 0.25.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-ARM

# Download and Install hugo
RUN mkdir /usr/local/hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/hugo/
RUN ls -lha /usr/local/hugo/
RUN ln -s /usr/local/hugo/hugo /usr/local/bin/hugo

ENTRYPOINT hugo
