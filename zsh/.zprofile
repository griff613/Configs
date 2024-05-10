#########################################################################
##### This file is only for commands that should only run in login shells
#########################################################################

echo "Sourcing .zprofile"

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=20000
SAVEHIST=20000

# Use extended history format
setopt EXTENDED_HISTORY

# Append history to the history file, no duplicates
setopt APPEND_HISTORY

# Don’t save duplicate commands consecutively
setopt HIST_IGNORE_DUPS

# Optionally, ignore space-beginning commands (often used for temporary commands)
setopt HIST_IGNORE_SPACE

# Save every command immediately to history file
setopt INC_APPEND_HISTORY

# Share history across terminals
setopt SHARE_HISTORY

setopt autocd extendedglob notify
unsetopt beep
bindkey -v
bindkey "^R" history-incremental-search-backward
#### End of lines configured by zsh-newuser-install ####

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    startx
fi

unset env

# The following lines were added by compinstall
zstyle :compinstall filename '/home/zach/.zshrc'
autoload -Uz vcs_info
precmd() {vcs_info}
zstyle ':vcs_info:git:*' formats '%b '

# End of lines added by compinstall

