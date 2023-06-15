#!/bin/bash

# Add to .bash_profile to load automaticly starting a shell 
# if [ -f ~/git/profiles/bash/git_aliases.sh ]; then
#         . ~/git/profiles/bash/git_aliases.sh
# fi

# Binds \e - ALT  \C - Strg
bind '"\eg":"git status;git log -1\n"' # ALT-g

export GIT_EDITOR=vim
alias gitconfig='git config credential.helper store && git config user.email "Udo.Fischer@deutsche-boerse.com" && git config user.name "pp108"'
alias gitadd='git add -A'
alias gita='gitadd'
alias gitblame='git blame ${1}'            # Ignore changes made by the revision 
alias gitb='gitblame'
alias gitbranch='git branch'               # List local branches in the current repository
alias gitbranchdelete='git branch -d ${1}' # Deletes the specific branch
alias gitcommit='git commit -a -m ${1}'    # $1 Commit Message
alias gitc='gitcommit' 
alias gitcheckout='git checkout ${1}'
alias gitcd='cd ~/git'
alias gitdiff='git diff ${1} HEAD'         # Use Commit id from gitreflog
alias gitdiffile='git diff --color-moved=dimmed-zebra ${1}' # Use git for normal file diff old new 
alias gitd='gitdiff'
alias gitfetch='git fetch'
alias gitf='gitfetch'
alias gitpull='git pull'
alias gitp='gitpull'
alias gitpush='git push'
alias gitremote='git remote --verbose'     # show remote connected repoisitory 
alias gitrestore='git restore ${1}'        # Restore file before add and commit  
alias gitr='gitremote'
alias gitreset='git reset --hard'          # revert uncommitted changes that exist in files that have been added to the index
alias gitrlv='git branch --list --remote --verbose' # List remote branches with their last commit 
alias gitrso='git remote show origin'      # show remote branches 
alias gitreflog='git reflog'               # Manage reference (Commit) log information
alias gitstatus='git status'
alias gitst='gitstatus'
alias gitswitch='git switch ${1}'          # Switch to specified branch 
alias gitsw='gitswitch'
alias gitlog='git log --oneline --all --graph --decorate'
alias gitl='gitlog'
alias gitlogs='gitlog'
alias gitlc='git log -1'                   # Last Commit ID
alias gitv='git --version'
