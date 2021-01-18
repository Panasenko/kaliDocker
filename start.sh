#!/bin/zsh

docker run -it --rm --net=host\
	       -p 22:22 \
	       -v "$(pwd)/host/.:/home/*/." \
	       security \
	       /bin/zsh
	    	