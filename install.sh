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
	then sh ./docker.sh
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
