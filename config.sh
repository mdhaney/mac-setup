#!/bin/bash

git pull origin master

#install ansible roles
#ansible-galaxy install -r requirements.yml

# run ansible
ansible-playbook --ask-vault-pass main.yml -i inventory
