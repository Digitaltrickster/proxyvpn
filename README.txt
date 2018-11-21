To run, replace $localhost_port_to_use with the localhost port on the host that proxy should run on:

docker run -it --cap-add NET_ADMIN -p 127.0.0.1:$localhost_port_to_use:1080 proxyvpn-ncc

Change Dockerfile by entering values for arguements vpnconfig (name of vpn config file) 
The vpn directory should have your config file in it, and any necessary keys.
