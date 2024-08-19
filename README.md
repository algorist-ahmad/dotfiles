# A blueprint for my ```/home```

This repo includes all my personal configurations, shortcuts, functions, aliases, and environment variables I wish to keep and reuse forever. This repo's **purpose** is to make it convenient to relocate my settings on any computer/OS I may use in the future. It's like the blueprint to reconstruct my home when I will eventually forget.

## File structure

Without preparation nor documentation, replicating my /home/ will consume too much time, and will be prone to errors, because dependencies will be incorrectly established.\
This is why everything will be documented here.


Tree:
```
.
|-- .bashrc -> config/bashrc
|-- .gitconfig -> config/.gitconfig
|-- .password-store
|-- TODO
|-- archives
|-- backup
|-- bills
|   |-- billrc
|   |-- *.data
|-- bin
|-- config
|   |-- .gitconfig
|   |-- .PATH
|   |-- bashrc
|   |-- exit-git-ps1
|-- data
|   `-- ahmad.sql
|-- journal
|-- lab
|-- logs
|-- repositories.txt
|-- resume
|-- scripts
|-- tasks
|   |-- .taskrc
|   |-- *.data
`-- trash
```

### Explanation

|directory|type|description
|-|-|-|
|[config](https://github.com/bytesmith-ahmad/linux-config)|repo|Contains all my configurations for bashrc and various apps.
|[.password-store](https://github.com/bytesmith-ahmad/pass)|repo|Contains all my secrets. To be used with ```pass``` to work. Requires to import gpg keys|
|[archives](https://github.com/bytesmith-ahmad/archives)|repo|Contains research, instructions, records, and more unused documents. Works with my ```arch``` script.|
|[bills](https://github.com/bytesmith-ahmad/bills)|repo|Where my expenses are managed|
|bin|regular|Contains all executables such as the ones acquired with ```wget``` and ending with ```*.amd64```. Formerly used to hold my personal scripts, but those go in their own directory now.|
|[data](https://github.com/bytesmith-ahmad/data)|repo|Backup for my Postgres data dump.
|[journal](https://github.com/bytesmith-ahmad/journal)|repo|Contains my journal entries. Must be used with ```jrnl```
|lab|regular|Contains active experiments and projects
|log|regular|Contains stderr output for debugging
|[resume](https://github.com/bytesmith-ahmad/resume)|repo|Contains my version-controlled resume.
|[scripts](https://github.com/bytesmith-ahmad/scripts)|repo|Contains all my executable scripts
|[tasks](https://github.com/bytesmith-ahmad/tasks)|repo|Contains my todo list. Must be used with ```taskwarrior```
|trash|regular|```rm``` has been replaced with ```del``` which moves files here to avoid accidental deletion.

## instructions 📜

These instructions are aimed at myself, ignore.

Remaining instructions:
- [x] import gpg keys
- [x] install *gh*
- [x] run ```gh auth login```, follow prompts
- [x] clone *pass*
- [x] clone *linux-config*
- [x] clone *scripts*
- [x] clone *tasks*
- [x] clone *bills*
- [x] clone *journal*
- [x] clone *archives*
- [x] clone *data*
- [x] clone *resume*
- [x] mv *pass* to *.password-store*
- [x] mv *linux-config* to *config* 
- [x] Symlink <u>.bashrc</u> to */config/bashrc

My personal bashrc will, in this order:

1. Load all my variables
2. Load all my aliases
3. Load all my functions
4. Load the prompt
5. Run the startup script

in /home:

Replace .bashrc -> config/bashrc\
Replace .gitconfig -> config/.gitconfig\
