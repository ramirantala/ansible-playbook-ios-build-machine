#!/bin/bash

group=
role_directory=/etc/ansible

sudo pip install ansible
if [ ! -d $role_directory ]; then
	sudo mkdir $role_directory
fi
sudo chown `whoami`:staff /etc/ansible

ansible-galaxy install -r install_roles.yml

ansible-playbook --ask-sudo-pass playbook.yml
