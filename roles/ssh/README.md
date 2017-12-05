SSH
=========

Installs or generates SSH keys.  Will look for a key downloaded from 1Password and copy it if found.  If no key is found, it will generate a new key.


Role Variables
--------------

ssh_public_source: 'id_rsa.pub'
ssh_private_source: 'id_rsa'
ssh_knownhosts_source: 'knownhosts'

Source file names in the vault downloaded by 1Password 