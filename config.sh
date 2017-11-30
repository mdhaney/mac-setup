#!/bin/bash

git pull origin master

#install ansible roles
#ansible-galaxy install -r requirements.yml

# run ansible
ansible-playbook main.yml -i inventory

# use if you want to pre-prompt for sudo password
#ansible-playbook main.yml -i inventory -K
