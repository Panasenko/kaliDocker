FROM kalilinux/kali-rolling

ENV USER_NAME security
ENV USER_PASSWORD root

# 

ENV DEBIAN_FRONTEND noninteractive
# do APT update
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean
# install Kali Linux "Top 10" metapackage and a couple "nice to have" tools
RUN apt-get -y install sudo micro git wget curl zsh micro ssh  kali-tools-top10 exploitdb  man-db dirb nikto wpscan uniscan net-tools
# initialize services
RUN service ssh start 
#add user
RUN adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME
# update the password
RUN echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd 
RUN usermod -aG sudo ${USER_NAME}

VOLUME /home/$USER_NAME

EXPOSE 22 

# the user we're applying this too (otherwise it most likely install for root)
USER $USER_NAME
# terminal colors with xterm
ENV TERM xterm
# set the zsh theme
ENV ZSH_THEME agnoster

WORKDIR /home/$USER_NAME

# run the installation script  
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

CMD ["zsh"]
