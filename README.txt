To run, replace $localhost_port_to_use with the localhost port that proxy should run on:

docker run -it --cap-add NET_ADMIN -p 127.0.0.1:$localhost_port_to_use:1080 proxyvpn-ncc

Change docker file replace config location and port desired
The vpn directory should have your config file in it, and any necessary keys.
