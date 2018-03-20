#!/bin/bash

# remove default apps
./wdr.sh -f clean.py

# start server and wait for it to start listening on port
/opt/IBM/WebSphere/AppServer/profiles/profile1/bin/startServer.sh server1 &
dockerize -wait tcp://localhost:9043 -timeout 180s
