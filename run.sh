#!/bin/bash

podman build --rm -t 1c .

if [[ $? -ne "0"  ]]; then 
	exit 1; 
fi

podman run --privileged --rm -it --name 1c \
	   -e DISPLAY=$DISPLAY \
	   --mount type=bind,source=/tmp,target=/tmp \
	   --mount type=bind,source=/home,target=/home \
           1c:latest 
