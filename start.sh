#!/bin/zsh

docker run -it -d \
		   --net=host \
		   -v $(pwd)/host/.:/home/security/ \
	       --name kali \
		   --privileged \
	       security \
	       zsh
	    	