
My home contains the following directories:

|directory|type|description
|-|-|-|
|[config](https://github.com/bytesmith-ahmad/linux-config)|repo|Contains all my configurations for bashrc and various apps.
|[pass](https://github.com/bytesmith-ahmad/pass)|repo|Contains all my secrets. To be used with ```pass``` and must be renamed to ```.password-store``` to work. Requires to import gpg keys|
|[archives](https://github.com/bytesmith-ahmad/archives)|repo|Contains research, instructions, records, and more unused documents. Works with my ```arch``` script.|
|[bills](https://github.com/bytesmith-ahmad/bills)|repo|Where my expenses are managed|
|bin|regular|Contains all executables such as the ones acquired with ```wget``` and ending with ```*.amd64```. Formerly used to hold my personal scripts, but those go in their own directory now.|
|[data](https://github.com/bytesmith-ahmad/data)|repo|Backup for my Postgres data dump.
|[journal](https://github.com/bytesmith-ahmad/journal)|repo|Contains my journal entries. Must be used with ```jrnl```
|[resume](https://github.com/bytesmith-ahmad/resume)|repo|Contains my version-controlled resume.
|[scripts](https://github.com/bytesmith-ahmad/scripts)|repo|Contains all my executable scripts
|[tasks](https://github.com/bytesmith-ahmad/tasks)|repo|Contains my todo list. Must be used with ```taskwarrior```
|trash|regular|```rm``` has been replaced with ```del``` which moves files here to avoid accidental deletion.

in /home:

Replace .bashrc -> config/bashrc\
Replace .gitconfig -> config/.gitconfig\
