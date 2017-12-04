onepass
=========

1Password integration.  Logs into 1Password and stores the session token as 'onepass_session_token' for later use.  If a vault name is specified, all the documents in that vault will be downloaded to a temporary directory which can be accessed as 'onepass_temp_dir'

Role Variables
--------------

onepass_subdomain: "haneyfamily"
onepass_email: "txmikester@gmail.com"
onepass_key: XXXXXXXXX
onepass_master_pass: XXXXX
onepass_vault

Customization
-------------

By default, these variables are populated from the encrypted 'secrets.yml' file (using Ansible vault).  You can override the values for your 1Password account either with or without Ansible vault.

### With ansible vault
1. Delete secrets.yml
2. Rename secrets-template.yml to secrets.yml
3. Fill in the variable values in the template
4. Encrypt the secrets.yml file: `ansible-vault encrypt secrets.yml`
5. When running the config, enter the password you used for encrypting the file when prompted for the vault password

### Without ansible vault

WARNING - don't do this if you are checking your files into Git or otherwise sharing them.

1. Delete secrets.yml
2. Add your overridden values for all the role variables to your /users/<userid>.yml file
3. Modify config.sh to remove the --ask-vault-pass argument from the ansible-playbook command
4. Never, ever, EVER check the project into Git or otherwise share it!
