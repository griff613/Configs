export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]\ "
PS1='\e[0;32m\W ~>\e[m '
############################################
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
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env

neofetch
##################################################
#

##--------------------Aliases-------------------##

# GENERAL
alias update='sudo pacman -Syu; sudo yay -Syu' # Update pacman and AUR

# DIRS
alias home='cd'

# APPS
alias chrome='google-chrome-stable &'
alias neo='neofetch' # Print the cool arch thing

# CONFIGS
alias alconf='gvim ~/.config/alacritty/alacritty.yml' # Alacritty config
alias xconf='vim /etc/X11/xorg.conf' # Xorg config
alias vimconf='gvim ~/.vimrc'

# OVERWRITES
alias grep='grep --color=auto'
alias ls='ls -lah --color=auto'

# AlIAS EDITING
alias al='gvim ~/.zshrc'
alias zal='gvim~/.bashrc'
alias cal='cat ~/.zshrc'
alias sauce='source ~/.zshrc'

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
