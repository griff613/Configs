# If not running interactively, don't do anything
#
[[ $- != *i* ]] && return


# Auto load SSH
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add ~/.ssh/id_ed25519
    # ssh-add home/zach/.ssh/id_ed25519.pub
    setxkbmap us -v dvorak &
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add ~/.ssh/id_ed25519
fi

unset env

neofetch

# Propmt
PS1="\[\e[36m\]\W > \[\e[m\] "
# PS2=">>" # what shows on multiline commands.

set -o vi

##--------------------Aliases-------------------##

# GENERAL
alias update='sudo pacman -Syu; sudo yay -Syu' # Update pacman and AUR`
alias fixmonitor='autorandr -l SceptreSamsung'
alias mv='mv -i'
alias rm='rm -i'
alias vim='nvim'
alias grep='grep -color=auto'
alias wmconf='helix ~/.config/awesome/rc.lua'
alias vimshortcuts='cat ~/.config/nvim/lua/core/keymaps.lua'
alias bb='sudo bleachbit --clean system.cache system.localizations system.trash system.tmp'
alias bigpackage='expac "%n %m" -l/'\n/' -Q $(pacman -Qq) | sort -rhk 2 | less'

# CONFIGS
alias alconf='helix ~/.config/alacritty/alacritty.yml' # Alacritty config
alias xconf='sudo nvim /etc/X11/xorg.conf' # Xorg config
alias pacconf='sudo nvim /etc/pacman.conf'

#Helix
alias vim='helix'
alias hx='helix'


# OVERWRITES
alias grep='grep --color=auto'

# AlIAS EDITING
alias al='helix ~/.bashrc'
alias cal='less ~/.bashrc'
alias sauce='source ~/.bashrc'

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
alias gs='git status'
alias gp='git push'
alias ga='git add .'

function gc() {
	git commit -m "$(date)"
}


# Quick Reference
alias ref='nvim ~/ref.txt'
alias cref='cat ~/ref.txt'

# Start/Enable
alias start='sudo systemctl start'
alias enab='sudo systemctl enable'

#Check internet connection
alias internet='ping archlinux.org'

# path for homegrown executables
PATH="$HOME/.local/bin:$PATH"

# Ergodox
alias ergodox='helix $ERGO/keymap.c'
alias keys='cat ~/.config/keymap.txt'

# Look at disk usage by dir (pretty cool)
alias why='ncdu'


export XMONAD_CONFIG_DIR="~/.config/.xmonad/xmonad.hs"
alias vimhelp="cat ~/.config/nvim/lua/bullgooselooney/remap.lua"
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias h='history'
alias ps='ps -au'
alias k='setxkbmap us -v dvorak'
alias postgres='psql -U postgres'
alias down='sudo shutdown now'
