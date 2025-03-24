last updated: 2025 march 24
comment: INSTALLATION NOT INTUITIVE. DOCUMENT enveavouros INSTALLATION (refer to screenshot on phone)
  THEN LIST DETAILED STEPS ON SETUP TO AVOID ERRORS AND TIME WllASTE. AUTOMATION HIGHLY RECOMMENDED

# A blueprint for my ```/home```

This repo includes all my personal configurations, shortcuts, functions, aliases, and environment
variables I wish to keep and reuse forever.

## [NEW] Instructions

Prepare mappings in dotfiles/link.map and then run dotfiles/link

## File structure

Without preparation nor documentation, replicating my /home/ will consume too much time, and will
be prone to errors, because dependencies will be incorrectly established.\
This is why everything will be documented here.

**Mappings will be stored in link.map**

### Explanation

|directory|type|description
|-|-|-|
|[dotfiles](https://github.com/bytesmith-ahmad/dotfiles)|repo|Contains all my configurations for bashrc and various apps.
|[archives](https://github.com/bytesmith-ahmad/archives)|repo|Contains research, instructions, records, and more unused documents. Works with my ```arch``` script.|
|bin|regular|Contains all executables such as the ones acquired with ```wget``` and ending with ```*.amd64```. Formerly used to hold my personal scripts, but those go in their own directory now.|
|logs|regular|Contains stderr output for debugging
|[scripts](https://github.com/bytesmith-ahmad/scripts)|repo|Contains all my executable scripts

## instructions 📜

**TODO**: AUTOMATION REQUIRED

These instructions are aimed at myself, ignore.

Remaining instructions:
- [x] Symlink <u>.bashrc</u> to */config/bashrc
- [x] gpg --import [PRIVATE KEYS]
- [x] install *gh*
- [x] run ```gh auth login```, follow prompts
- [x] clone *nexus --recursive*
- [x] clone *pass*
- [x] clone *dotfiles*
- [x] clone *scripts* as ~/bin
- [x] clone *archives*
- [ ] create untracked directories such as src [AUTOMATION REQUIRED]
- [ ] install packages [AUTOMATION REQUIRED]

My personal bashrc will, in this order:

1. Load all my variables
2. Load all my aliases
3. Load all my functions
4. Load the prompt
5. Run the startup script

in /home:

Replace .bashrc -> dotfiles/bashrc\
Replace .gitconfig -> dotfiles/.gitconfig\
