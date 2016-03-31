#!/bin/bash

group=
role_directory=/etc/ansible

curl -O https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

sudo pip install ansible
if [ ! -d $role_directory ]; then
	sudo mkdir $role_directory
fi
sudo chown `whoami`:staff /etc/ansible

ansible-galaxy install -r install_roles.yml

ansible-playbook --ask-sudo-pass playbook.yml
