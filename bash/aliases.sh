#!/bin/bash

# Add to .bash_profile or .bashrc or .bash_aliases to load automaticly starting a shell 
# if [ -f ~/git/profiles/bash/aliases.sh ]; then
#         . ~/git/profiles/bash/aliases.sh
# fi

# override aliashome if its is different from /home/<user> - otherweise /home/<user> we will use as default $HOME
if [ -z ${aliashome+x} ]; then aliashome=$HOME ; fi 

# create local git profiles repository 
alias gitcloneprofiles='cd ${aliashome}/git && git clone https://github.com/ufi68/profiles.git'
# git config --global credential.helper store # Store user / pw or token

# show aliase
alias a='alias'
alias aliases='alias'

# edit alias files - link from ~/.bash_aliases 
alias ae='vim ${aliashome}/git/profiles/bash/aliases.sh'
alias as='. ${aliashome}/git/profiles/bash/aliases.sh && echo "Sourced own aliases from ${aliashome}/git/profiles/bash/aliases.sh"'
alias av='cat ${aliashome}/git/profiles/bash/aliases.sh && echo "View aliases definitions from ${aliashome}/git/profiles/bash/aliases.sh"'
alias acd='cd ${aliashome}/git/profiles/bash'
alias ab=acd
alias aup='cwd=$(pwd) && acd && gitp && cd $cwd'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Misc
alias e='vim ${1}'
alias p='pwd'
alias v='cat ${1}'
alias dus='du -sh .' # Disk Usage Summary in K/M/G
# alias l='ls ${1}' - exist ;) 
alias grepts='grep -ir ${1}' # grep Text search 

# Binds \e - ALT  \C - Strg
bind '"\ed":"pwd;ls -Al --group-directories-first\n"' # ALT-d
bind '"\ep":"pwd\n"' # ALT-rp

# History
# !n execute the no from history
# alias h='history 50 && echo "use !<no> to execute the command from history"' # last n commands
# https://stackoverflow.com/questions/4438147/alias-with-variable-in-bash
alias h='_h() { history 50 | grep "$1" ; echo "use !<no> to execute the command from history";}; _h'
HISTTIMEFORMAT="%F %T: "
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# OS Version and name
alias ver='cat /etc/os-release && cat /proc/version_signature && uname -v'

if [[ ${1} == "-v" ]]; then 
  echo "${BASH_SOURCE[0]} successfully sourced" 
fi
