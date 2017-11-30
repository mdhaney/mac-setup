# mac-setup
## Intro
Scripts and notes for bootstrapping a new Mac with multiple accounts (I use separate accounts for work, personal, consulting, etc.).  

## Bootstrap
Start with a clean install of OSX and go through the installation wizard as usual (set iCloud ID, etc.) for one of your accounts.  Then download the [bootstrap script](https://raw.githubusercontent.com/mdhaney/mac-setup/master/bootstrap.sh) and execute it from the command line.  This does the following:
- installs the Xcode command-line tools (needed by just about everything else)
- installs ansible
- creates a 'brew' group and installs homebrew
- adjusts permissions so any user added to the brew group will be able to manage homebrew (all users can use brew packages, just not install or update)
- clones the repo and runs Ansible for the current user

## Configuring users

TODO


## Documentation

TODO - document vars and override values
