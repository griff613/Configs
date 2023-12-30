#
[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.local/bin:$JAVA_HOME:$PATH"

export HISTCONTROL=ignoreboth # Remove duplicates from history.

# Environment
export HOME=/home/zach
export EDITOR=neovim
export TERM=xfce4-terminal

# XDG Base Directory Specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export JAVA_HOME=/usr/lib64/jvm/java-21-openjdk

#Config file paths
export PACCONF=/etc/pacman.conf
export XRC=/usr/lib/X11/xinit
export XMONAD_CONFIG_DIR=$HOME/.config/xmonad

# PATH
export PATH="$HOME/.local/bin:$JAVA_HOME:$PATH"

# Hoe made
export ERGO=/home/zach/qmk_firmware/keyboards/ergodox_ez/keymaps/griff613

# Auto start x only if in tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi
