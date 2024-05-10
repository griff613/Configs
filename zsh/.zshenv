#########################################################################
##### Environment
#########################################################################

echo "Sourcing .zshenv"

export HOME=/home/zach
export EDITOR=neovim
# export TERM=xfce4-terminal
export XORG_CONFIG=/etc/X11/xorg.conf
export RUST_BACKTRACE=1
export SHELL=/bin/zsh
export HISTCONTROL=ignoreboth # Remove duplicates from history.
export ERGO=/home/zach/qmk_firmware/keyboards/ergodox_ez/keymaps/griff613 # Hoe made
export JAVA_HOME=/usr/lib64/jvm/java-21-openjdk

#Config file paths
export PACCONF=/etc/pacman.conf
export XRC=/usr/lib/X11/xinit
export XMONAD_CONFIG_DIR=$HOME/.config/xmonad
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export ZSHRC="$HOME/.config/zsh/.zshrc"
export ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"
export PACMAN_CONFIG="/etc/pacman.conf"
export AWESOME_CONFIG="$HOME/.config/awesome/rc.lua"

# Quick directory paths
export PROJECT_DIRECTORY="$HOME/Projects"
export STE="$HOME/Projects/rust-projects/ste/"

# PATH
export PATH="$HOME/.local/bin:$JAVA_HOME:$PATH"
export PATH="/usr/lib/rustup/bin/rust-analyzer:$PATH"
export PATH="$HOME/.local/bin:$JAVA_HOME:$PATH"
export PATH="$HOME/.local/bin:$PATH"
