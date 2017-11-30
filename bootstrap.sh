#!/bin/bash

# ask for admin password
sudo -v

# keep-alive sudo until script ends
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#install command-line tools
xcode-select --install

#create brew group
sudo dseditgroup -o create -n /Local/Default -r "Homebrew" brew
sudo dseditgroup -o edit -n /Local/Default -a $(whoami) -t user brew

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# change homebrew permissions
sudo chgrp -R brew /usr/local/bin /usr/local/etc /usr/local/include /usr/local/lib /usr/local/sbin /usr/local/share /usr/local/var /usr/local/Frameworks /usr/local/share/man /usr/local/opt
sudo chmod -R g+w /usr/local/bin /usr/local/etc /usr/local/include /usr/local/lib /usr/local/sbin /usr/local/share /usr/local/var /usr/local/Frameworks /usr/local/share/man /usr/local/opt

# install ansible
sudo easy_install pip
sudo pip install ansible

# clone the config repo
git clone https://github.com/mdhaney/mac-setup.git /Users/Shared/mac-setup

# run config
/Users/Shared/mac-setup/config.sh



