#########################################################################
##### These run after login shell commands (after shell initialized)
#########################################################################

echo "Sourcing .login"

# Auto start x only if in tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi

