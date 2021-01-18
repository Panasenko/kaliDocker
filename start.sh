#!/bin/zsh

docker run -it --rm --net=host\
		   -v $(pwd)/host/.:/home/security/ \
	       --name kali \
		   --privileged \
	       security \
	       /bin/zsh
	    	