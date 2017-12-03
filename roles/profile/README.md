profile
=========

Main role.  Installs all apps, applies settings, builds the user profile (.bash_profile).

Dependant roles can add bash_profile settings to the following arrays as needed:
- bash_lines: full lines for bash_profile
- bash_paths: directories to be added to the path
- bash_exports: exports
- bash_aliases: aliases

Care must be taken to not overwrite any existing values in these variables, and to also define them if they don't exist yet before using.  See 'java8' and 'sublime' roles for examples.

Role Variables
--------------
profile_lines
profile_exports
profile_paths
profile_aliases

Dependencies
------------
Everything, basically