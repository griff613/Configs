# If not running interactively, don't do anything
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
    ssh-add
    setxkbmap us -v dvorak &
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

neofetch

# Propmt
PS1="\[\e[36m\]\W > \[\e[m\] "
PS2=">>" # what shows on multiline commands.


##--------------------Aliases-------------------##

# GENERAL
alias update='sudo pacman -Syu; sudo yay -Syu' # Update pacman and AUR`
alias fixmonitor='autorandr -l SceptreSamsung'
alias mv='mv -i'
alias rm='rm -i'
alias vim='nvim'
alias grep='grep -color=auto'

# DIRS
alias home='cd'
alias ddp='cd Projects/deck-design-pro'

# APPS
alias chrome='google-chrome-stable &'
alias neo='neofetch' # Print the cool arch thing

# CONFIGS
alias alconf='nvim ~/.config/alacritty/alacritty.yml' # Alacritty config
alias xconf='sudo nvim /etc/X11/xorg.conf' # Xorg config
alias nvimconf='nvim ~/.nvimrc' # nvim config
alias xmconf='nvim ~/.config/xmonad/xmonad.hs'
alias xmob0='nvim ~/.config/xmobar/sceptre.xmobarrc'
alias xmob1='nvim ~/.config/xmobar/samsung.xmobarrc'
alias pacconf='sudo nvim /etc/pacman.conf'

# OVERWRITES
alias grep='grep --color=auto'
# alias ls='exa --long --git'
# alias la='exa --long --git --grid --all'

# AlIAS EDITING
alias al='nvim ~/.bashrc'
alias cal='less ~/.bashrc'
alias sauce='source ~/.bashrc'

# Xorg CONTROL
alias killx='pkill -15 Xorg'
alias x='startx'

# PROGRAMMING
alias idea='/opt/idea-IU-223.8617.56/bin/idea.sh &'
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
alias ergodox='nvim $ERGO/keymap.c'
alias keys='cat ~/.config/keymap.txt'

# Look at disk usage by dir (pretty cool)
alias why='ncdu'


export XMONAD_CONFIG_DIR="~/.config/.xmonad/xmonad.hs"
alias vimhelp="cat ~/.config/nvim/lua/bullgooselooney/remap.lua"
alias ls='ls -lh --color=auto'
alias la='ls -lah --color=auto'
alias h='history'
alias ps='ps -au'
alias k='setxkbmap us -v dvorak'
