#!/bin/bash  
clear
echo "sudo requis? [y/n]"
read admin
if [ $admin = y ]
	then admin=sudo
fi
#==============Update==============
clear
echo "update ? [y/n]"
read update
if [ $update = y ]
	then $admin apt-get update && $admin apt-get upgrade
fi

#==============Basics==============
clear
echo "Install basics ? [y/n]"
read basics
if [ $basics = y ]
	then $admin apt-get install -y wget curl git htop
fi

#==============Docker==============
clear
echo "installer docker ? [y/n]"
read install_docker
if [ $install_docker = y ]
	then $admin apt-get purge lxc-docker* && $admin apt-get purge docker.io* && $admin apt-get update
		 $admin apt-get install apt-transport-https ca-certificates
		 $admin apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
		 $admin echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list
		 $admin apt-get update && $admin apt-cache policy docker-engine
		 $admin apt-get update
		 $admin apt-get install docker-engine && $admin service docker start
fi

#===============Tmux================
echo "installer tmux ? [y/n]"
read install_tmux
if [ $install_tmux = y ]
	then $admin apt-get install tmux
fi
