FROM alpine:3.5

LABEL maintainer "Yonatan Romero <yromero@openmailbox.org>"

ENV VERSION "3.5.23-r0"

RUN apk update && apk add squid=$VERSION

# expose default squid port
EXPOSE 3128/tcp

# expose volumes to configure squid and log dir
VOLUME /etc/squid /var/log/squid

# create cache dirs
RUN /usr/sbin/squid -N -f /etc/squid/squid.conf -z

# run squid
CMD ["/usr/sbin/squid", "-f", "/etc/squid/squid.conf", "-N", "-d", "7"]