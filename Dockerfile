FROM alpine:latest

#change these to reflect the location of your openvpn config file and 
#what localhost only port you want to access the proxy on

ARG config=
ENV vpnconfig=$config
ARG localport=

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add dante-server && \
    apk add openvpn

COPY danted.conf /etc/
COPY vpn/$config /etc/openvpn/
COPY entry.sh /

EXPOSE 127.0.0.1:$localport:$localport

ENTRYPOINT ["/entry.sh"]
