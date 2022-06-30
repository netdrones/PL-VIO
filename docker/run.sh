#!/bin/bash

# UI permissions
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

# Allow X server connection
xhost +local:docker
docker run -it --rm \
  --env="DISPLAY" \
  --env="QT_X11_no_mitshm=1" \
  --volume="/tmp/.x11-unix:/tmp/.x11-unix:rw" \
  ghcr.io/netdrones/plvio:0.0.1

# Disallow X server connection
xhost -local:root
