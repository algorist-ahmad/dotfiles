# A blueprint for my ```/home```

This repo includes all my personal configurations, shortcuts, functions, aliases, and environment
variables I wish to keep and reuse forever.

## [NEW] Instructions

Prepare mappings in dotfiles/link.map and then run dotfiles/link

## File structure

Without preparation nor documentation, replicating my /home/ will consume too much time, and will
be prone to errors, because dependencies will be incorrectly established.\
This is why everything will be documented here.

Tree:
```
.
|-- .bashrc -> dotfiles/bashrc
|-- .gitconfig -> dotfiles/.gitconfig
|-- .password-store
|-- bin
|-- dotfiles
|-- data
|-- logs
|-- repositories.txt
|-- scripts
```

**Mappings will be stored in link.map**

### Explanation

|directory|type|description
|-|-|-|
|[dotfiles](https://github.com/bytesmith-ahmad/dotfiles)|repo|Contains all my configurations for bashrc and various apps.
|[.password-store](https://github.com/bytesmith-ahmad/pass)|repo|Contains all my secrets. To be used with ```pass``` to work. Requires to import gpg keys|
|[archives](https://github.com/bytesmith-ahmad/archives)|repo|Contains research, instructions, records, and more unused documents. Works with my ```arch``` script.|
|bin|regular|Contains all executables such as the ones acquired with ```wget``` and ending with ```*.amd64```. Formerly used to hold my personal scripts, but those go in their own directory now.|
|logs|regular|Contains stderr output for debugging
|[scripts](https://github.com/bytesmith-ahmad/scripts)|repo|Contains all my executable scripts

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

Replace .bashrc -> dotfiles/bashrc\
Replace .gitconfig -> dotfiles/.gitconfig\
