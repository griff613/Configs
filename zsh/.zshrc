# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob notify
unsetopt beep
bindkey -v
bindkey "^R" history-incremental-search-backward

# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/zach/.zshrc'

autoload -Uz vcs_info
precmd() {vcs_info}
zstyle ':vcs_info:git:*' formats '%b '
# compinit

setopt PROMPT_SUBST
PROMPT='[ %F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f]$ '
neofetch
# Env
export HOME="/home/zach"

export ZSHRC="$HOME/.config/zsh/.zshrc"
export ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"
export XORG_CONFIG="/etc/X11/xorg.conf"
export PACMAN_CONFIG="/etc/pacman.conf"
export AWESOME_CONFIG="$HOME/.config/awesome/rc.lua"

export RUST_BACKTRACE=1
export PROJECT_DIRECTORY="~/Projects"
export SHELL="/bin/zsh"
export STE="$HOME/Projects/rust-projects/simple-text-editor/"

# End of lines added by compinstall

# General
alias update='sudo pacman -Syu; sudo yay -Syu' # Update pacman and AUR`
alias fixmonitor='autorandr -l SceptreSamsung'
alias mv='mv -i'
alias rm='rm -i'
alias vim='helix'
alias grep='grep -color=auto'
alias wmconf='helix $HOME/.config/awesome/rc.lua'
alias bb='sudo bleachbit --clean system.cache system.localizations system.trash system.tmp'
alias bigpackage='expac "%n %m" -l/'\n/' -Q $(pacman -Qq) | sort -rhk 2 | less'
alias why='ncdu'
alias h='history'
alias ps='ps -au'
alias k='setxkbmap us -v dvorak'
alias postgres='psql -U postgres'
alias down='sudo shutdown now'

# cd ez
alias projd='cd ~/Projects'
alias rustd='cd ~/Projects/rust-projects'
alias steved='cd $PROJECT_DIRECTORY/steve-and-sons'
alias ste='cd $STE'

# CONFIGS
alias alconf='helix $ALACRITTY_CONFIG' # Alacritty config
alias xconf='sudo helix $XORG_CONFIG' # Xorg config
alias pacconf='sudo helix $PACMAN_CONFIG'
alias aweconf='helix $AWESOME_CONFIG'
alias al='helix $ZSHRC'
alias cal='less $ZSHRC'
alias sauce='source $ZSHRC'

# Text Editor
alias vim='helix'
alias hx='helix'


# OVERWRITES
alias grep='grep --color=auto'
alias ls='ls -lah --color=auto'
alias ll='ls -lah --color=auto'
alias h='history'
alias ps='ps -au'

# AlIAS EDITING

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

# path for homegrown executables
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/lib/rustup/bin/rust-analyzer:$PATH"


# Ergodox
alias ergodox='helix $ERGO/keymap.c'
alias keys='cat $HOME/.config/keymap.txt'

# Look at disk usage by dir (pretty cool)
