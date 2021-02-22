#!/bin/bash

#verifica arquitetura do sistema e  executa instalação
function instalaVB(){
	if [ $(uname -m) = "x86_64" ]; then
		echo "sistema 64"
		wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
		echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bionic contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
		sudo apt update
		sudo apt install virtualbox-6.0
		wget https://download.virtualbox.org/virtualbox/6.0.14/Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack
                sudo apt-get install ./Oracle_VM_VirtualBox_Extension_Pack-6.0.14.vbox-extpack 
	else
		echo "32 bits"
		wget https://download.virtualbox.org/virtualbox/5.2.22/VirtualBox-5.2.22-126460-Linux_x86.run -O virtualbox.run
		chmod +x virtualbox.run
	        sudo ./virtualbox.run
	fi
}
#inicio da execucao#
function menu (){
valor=0
while [ $valor -le 6 ];
do
	echo "[ 1 -  Instalar Virtual Box        ]"
	echo "[ 2 -  Desinstalar Virtual-Box     ]"
	echo "[ 3 -  Atualizar sistema           ]"
	echo "[ 4 -  Instalador virtual-box-dkms ]"
        echo "[ 5 -  desinstalar virtualbox-dkms ]"
	echo "[ 6 -  sair                        ]"

	read valor
if [ "$valor" -eq 1 ];then
    echo "instalação virtual box"
	 instalaVB
	 sleep 7.0 $valor
elif [ "$valor" -eq 2 ];then
    echo "Desinstalação virtual box"
	 sudo apt-get remove VirtualBox-6.1.14-140239-Linux_amd64.run
	 sudo apt-get remove virtualbox-6.0
	   sleep 7.0 $valor
elif [ "$valor" -eq 3 ];then
	 sudo apt-get update
	 sleep 2.0
	 sudo apt-get upgrade
   	 sleep 7.0 $valor

elif [ "$valor" -eq 4 ];then
         sudo apt-get update
         sudo apt-get autoremove
         sudo apt-get install virtualbox-dkms
         clear
	 $valor

elif [ "$valor" -eq 5 ];then
	sudo apt-get autoremove
	sudo apt-get remove virtualbox-dkms
	sleep 7.0
	clear
	$valor

elif [ "$valor" -eq 6 ];then
	clear
	exit -1
fi

done
