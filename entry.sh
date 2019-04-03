#!/bin/sh
set -e 
/bin/mkdir -p /dev/net
/bin/mknod /dev/net/tap c 10 200
/bin/mknod /dev/net/tun c 10 200

/usr/sbin/openvpn --daemon --config /etc/openvpn/$vpnconfig
while [[ `ip a show tun0 up` == *does not exist* ]];
do
done
/usr/sbin/sockd -f /etc/danted.conf
