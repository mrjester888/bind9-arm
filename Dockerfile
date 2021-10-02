FROM ubuntu:focal

LABEL LABEL org.opencontainers.image.source https://github.com/mrjester888/bind9-arm

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8

RUN apt-get -qq update
RUN apt-get -qq install apt-utils software-properties-common dctrl-tools

ARG DEB_VERSION=1:9.16.1-0ubuntu2.8
RUN apt-get -qq update && apt-get -qq install bind9=$DEB_VERSION bind9-utils=$DEB_VERSION
RUN apt-get clean all

RUN mkdir -p /etc/bind && chown root:bind /etc/bind/ && chmod 755 /etc/bind
RUN mkdir -p /var/cache/bind && chown bind:bind /var/cache/bind && chmod 755 /var/cache/bind
RUN mkdir -p /var/lib/bind && chown bind:bind /var/lib/bind && chmod 755 /var/lib/bind
RUN mkdir -p /var/log/bind && chown bind:bind /var/log/bind && chmod 755 /var/log/bind
RUN mkdir -p /run/named && chown bind:bind /run/named && chmod 755 /run/named

VOLUME ["/etc/bind", "/var/cache/bind", "/var/lib/bind", "/var/log"]

EXPOSE 53/udp 53/tcp 953/tcp

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]
