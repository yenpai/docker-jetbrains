#!/bin/bash
docker run --rm \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v ~/.WebIde100:/home/developer/.WebIde100 \
	-v /work:/work \
	yenpai/jetbrains-phpstorm
