# mac-setup
## Intro
Scripts and notes for bootstrapping a new Mac with multiple accounts (I use separate accounts for work, personal, consulting, etc.).

## Why?
There are a lot of playbooks and/or shell scripts out there for setting up Macs.  Why not use one of them?  There are a couple of reasons.  First, most of them assume a single user account, and don't work well with multiple users.  That doesn't work for me, as I have several accounts used to separate work from personal, etc.

Second, I didn't like the design of any of them.  For example, most playbooks would just have a big list in a var file for which brew packages to install, or what NPM modules to install, etc.  That's fine, I guess, but to me it made more sense to package configuration by application, and use the power of Ansible roles and dependencies to manage the rest.

For example, to use IntelliJ/Cursive requires Clojure, leiningen, git, etc.  Rather than remembering which NPM packages to install, which Brew packages, what needs to be added to the path in my bash profile, etc. - just package it all up into a coherent role.  IntelliJ requires Git, and when git is set as a dependency, then the IntelliJ role can assume that Git has been installed and configured already, and just focus on the steps needed to setup IntelliJ.  Git requires SSH keys, which require Bash, etc.

This should make it easier to add and remove applications in a configuration without worrying about all the cross-cutting concerns.  I also hope it will make it easier to keep these configs up to date, IOW when I install a new app, just create a new role for it, set its dependencies, and focus on the few steps to get that app installed and configured - rather than hunting through the entire project to find all the references, dependencies, etc.  Finally, it should make it easier to support UN-install of applications - not supported yet, but already thinking about how to do it. ;)

## Bootstrap
Start with a clean install of OSX and go through the installation wizard as usual (set iCloud ID, etc.) for one of your accounts.  Then download the [bootstrap script](https://raw.githubusercontent.com/mdhaney/mac-setup/master/bootstrap.sh) and execute it from the command line.  This does the following:
- installs the Xcode command-line tools (needed by just about everything else)
- installs ansible
- creates a 'brew' group and installs homebrew
- adjusts permissions so any user added to the brew group will be able to manage homebrew (all users can use brew packages, just not install or update)
- clones the repo and runs config.sh

## Update config
Whenever you want to update, just run config.sh.  It will pull the latest changes from Git and apply any new configuration to the current user.  Each time it runs, it will prompt for the sudo password up front and your Ansible vault password (see Security section).

## Creating users
Use the *System Preferences - Users and Groups* pane to create users as usual, then login as the new user and follow the wizard to configure iCloud, etc.  Once completed, in a terminal do the following:

`cd /Users/Shared/mac-setup
./config.sh`

A default configuration will be used to configure the user, but this can be overridden by creating a new file in the /users folder named <userid>.yml.  You can use one of my included user files as a template - copy it and rename it to your username and customize as needed.  Refer to the documentation for each role for what variables are available for customization.


## Documentation
Each of the roles has their own documentation, including which variables can be overridden

## Security
I use 1Password already to manage passwords, so it made sense to use it as well to store API keys, SSH keys, software licenses, etc.  Whenever the scripts require this information, they retrieve it from 1Password's cloud service using their command-line utility.

The 1Password parameters (Secret Key, Subdomain, Email, Master-Password) are stored in an encrypted Ansible vault.  See the README for the 'onepass' role for info on how to set these parameters for your own 1Password account.