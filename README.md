# mac-setup
## Intro
Scripts and notes for bootstrapping a new Mac with multiple accounts (I use separate accounts for work, personal, consulting, etc.).  

## Bootstrap
Start with a clean install of OSX and go through the installation wizard as usual (set iCloud ID, etc.) for one of your accounts.  Then download the [bootstrap script](https://raw.githubusercontent.com/mdhaney/mac-setup/master/bootstrap.sh) and execute it from the command line.  This does the following:
- installs the Xcode command-line tools (needed by just about everything else)
- installs ansible
- creates a 'brew' group and installs homebrew
- adjusts permissions so any user added to the brew group will be able to manage homebrew (all users can use brew packages, just not install or update)
- clones the repo and runs config.sh

## Update config
Whenever you want to update, just run config.sh.  It will pull the latest changes from Git and apply any new configuration to the current user.  Each time it runs, it will prompt for the sudo password up front, and possibly your 1Password info (see Security section).

## Creating users
Use the *System Preferences - Users and Groups* pane to create users as usual, then login as the new user and follow the wizard to configure iCloud, etc.  Once completed, in a terminal do the following:

`cd /Users/Shared/mac-setup
./config.sh`

A default configuration will be used to configure the user, but this can be overridden by creating a new file in the /users folder named <userid>.yml.  You can use one of my included user files as a template - copy it and rename it to your username and customize as needed.  Refer to the documentation for each role for what variables are available for customization.


## Documentation
Each of the roles has their own documentation, including which variables can be overridden

## Security
I use 1Password already to manage passwords, so it made sense to use it as well to store API keys, SSH keys, software licenses, etc.  Whenever the scripts require this information, they retrieve it from 1Password's cloud service using their command-line utility.

The first time the configuration runs, it will prompt you for all the 1Password information, including the secret key.  After the initial run, you will only have to enter the password when accessing 1Password.