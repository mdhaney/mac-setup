#!/bin/bash

# ask for admin password
sudo -v

# keep-alive sudo until script ends
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#install command-line tools
#xcode-select --install

# install homebrew
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#install ansible
sudo easy_install pip
sudo pip install ansible