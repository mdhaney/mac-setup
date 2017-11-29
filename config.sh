#!/bin/bash

#install ansible roles
ansible-galaxy install -r requirements.yml

# run ansible
ansible-playbook main.yml -i inventory -K
