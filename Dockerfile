FROM alpine:latest

#change these to reflect the location of your openvpn config file and 
#what localhost only port you want to access the proxy on

ARG config=
ENV vpnconfig=$config
ARG localport=1080

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade && \
    apk add dante-server && \
    apk add openvpn

COPY danted.conf /etc/
COPY vpn/* /etc/openvpn/
COPY entry.sh /

EXPOSE 127.0.0.1:$localport:1080

ENTRYPOINT ["/entry.sh"]
