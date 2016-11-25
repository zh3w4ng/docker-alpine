FROM alpine:3.4
MAINTAINER Zhe Wang <zh3w4ng@gmail.com>

##
## ROOTFS
##

# root filesystem
COPY rootfs /

# s6 overlay
RUN apk add --no-cache curl && \
  curl -L -s https://github.com/just-containers/s6-overlay/releases/download/v1.18.1.5/s6-overlay-amd64.tar.gz | tar xvzf - -C / && \
  apk del --no-cache curl

##
## INIT
##

ENTRYPOINT [ "/init" ]
