#!/bin/bash  
clear
echo "sudo requis? [y/n]"
read admin
if [ $admin = y ]
	then admin=sudo
else admin=
fi

#==============Update==============
clear
echo "update ? [y/n]"
read update
if [ $update = y ]
	then $admin apt-get update && $admin apt-get -y upgrade
fi

#==============Basics==============
clear
echo "Install basics ? [y/n]"
read basics
if [ $basics = y ]
	then $admin apt-get install -y wget curl git htop vim
fi

#==============Docker==============
clear
echo "installer docker ? [y/n]"
read install_docker
if [ $install_docker = y ]
	then $admin apt-get purge lxc-docker* && $admin apt-get purge docker.io* && $admin apt-get update
		 $admin apt-get install -y apt-transport-https ca-certificates
		 $admin apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
		 echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | $admin tee /etc/apt/sources.list.d/docker.list
		 $admin apt-get update && $admin apt-cache policy docker-engine
		 $admin apt-get update
		 $admin apt-get install -y docker-engine && $admin service docker start
		 echo "Docker has been launched"
		 sleep 3
fi



#===============Tmux================
clear
echo "installer tmux ? [y/n]"
read install_tmux
if [ $install_tmux = y ]
	then $admin apt-get install -y tmux
	echo "Tmux has been installed"
sleep 3
fi
