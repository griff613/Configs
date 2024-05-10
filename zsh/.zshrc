#########################################################################
##### Aliases and commands for all interactive shells
#########################################################################
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
# Call my script to add the ssh key
~/.config/systemd/user/load-ssh-keys.sh

#Reverse search
bindkey '^R' history-incremental-search-backward
export TEXT_EDITOR='nvim'


# init
fastfetch
setopt PROMPT_SUBST
PROMPT='[ %F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f]$ '

# General
alias mv='mv -i'
alias rm='rm -i'
alias vim='$TEXT_EDITOR'
alias grep='grep -color=auto'
alias wmconf='$TEXT_EDITOR $HOME/.config/awesome/rc.lua'
alias bb='sudo bleachbit --clean system.cache system.localizations system.trash system.tmp'
alias bigpackage='expac "%n %m" -l/'\n/' -Q $(pacman -Qq) | sort -rhk 2 | less'
alias why='ncdu'
alias h='history'
alias ps='ps -au'
alias k='setxkbmap us -v en'
alias postgres='psql -U postgres'
alias down='sudo shutdown now'
alias mir='sudo reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist'

# cd ez
alias projd='cd $PROJECT_DIRECTORY'
alias rustd='cd ~/Projects/rust-projects'
alias steved='cd $PROJECT_DIRECTORY/steve-and-sons'
alias ste='cd $STE'

# CONFIGS
alias alconf='%TEXT_EDITOR $ALACRITTY_CONFIG' # Alacritty config
alias xconf='sudo $TEXT_EDITOR $XORG_CONFIG' # Xorg config
alias pacconf='sudo $TEXT_EDITOR $PACMAN_CONFIG'
alias aweconf='$TEXT_EDITOR $AWESOME_CONFIG'
alias al='$TEXT_EDITOR $ZSHRC'
alias cal='less $ZSHRC'
alias sauce='source $ZSHRC'
alias xmconf='cd .config/xmonad; vim .'
alias xmconf='cd .config/xmonad; vim .'

# Text Editor
alias vim='$TEXT_EDITOR'
alias hx='$TEXT_EDITOR'

# OVERWRITES
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias h='history'
alias ps='ps -au'

# Xorg CONTROL
alias killx='pkill -15 Xorg'
alias x='startx'

# PROGRAMMING
alias py='python3'

# VPN
alias vpn='nordvpn connect'
alias vpnx='nordvpn disconnect'

# TOR
alias torup='sudo systemctl start tor'
alias retor='sudo systemctl restart tor'
alias tordown='sudo systemctl stop tor'
alias torstat='sudo systemctl status tor'
alias tor='torbrowser-launcher'

# GIT
alias gcob='git checkout -b'
alias gs='git status'
alias gp='git push'
alias ga='git add .'

function gc() {
	git commit -m "$(date)"
}

# Start/Enable
alias start='sudo systemctl start'
alias enab='sudo systemctl enable'

#Check internet connection
alias internet='ping archlinux.org'

# Ergodox
alias ergodox='TEXT_EDITOR $ERGO/keymap.c'
alias keys='cat $HOME/.config/keymap.txt'

echo ".zshrc - Good"
