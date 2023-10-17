#!/bin/bash

#https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-20-04-pt

#Atualizar servidor
yes | sudo apt update
echo "apt update - FEITO"

#Instalar Ansible
yes | sudo apt install ansible
echo "apt install ansible - FEITO"

#Instalar python3.11
yes | sudo apt install python3.11
echo "apt install python3.11 - FEITO"

if [[ ! -e /etc/ansible ]]; then
	
	#Criar pasta se não existir
    mkdir /etc/ansible
	
	echo "Pasta /etc/ansible - CRIADA e ficheiro hosts - CRIADO e CONFIGURADO"

elif [[ ! -d /etc/ansible ]]; then
    echo "/etc/ansible already exists - Não atualizei nada" 1>&2
fi


#Preencher os Hosts
echo '[control_plane]'                                    						>> /etc/ansible/hosts
echo 'control-plane ansible_host=192.168.56.101 hostname=control-plane'         >> /etc/ansible/hosts
echo '[nodes]'                                    						        >> /etc/ansible/hosts
echo 'node1 ansible_host=192.168.56.102 hostname=node1'                         >> /etc/ansible/hosts
echo 'node2 ansible_host=192.168.56.103 hostname=node2'                         >> /etc/ansible/hosts
echo 'node3 ansible_host=192.168.56.104 hostname=node3'                         >> /etc/ansible/hosts
echo '[redis]'                                    								>> /etc/ansible/hosts
echo 'redismaster ansible_host=192.168.56.110 hostname=redismaster'             >> /etc/ansible/hosts
echo '[mirth]'                                    							    >> /etc/ansible/hosts
echo 'mirth1 ansible_host=192.168.56.102 hostname=mirth1'                       >> /etc/ansible/hosts
echo '[all:vars]'                                   							>> /etc/ansible/hosts
echo 'ansible_user=vagrant'  													>> /etc/ansible/hosts
echo 'ansible_password=vagrant' 												>> /etc/ansible/hosts
