if [[ "$(uname)" == "Linux" ]]
then
  # capslock becomes another ctrl
  /usr/bin/env setxkbmap -option "ctrl:nocaps"

  # make the logitech mouse acceleration to 1 (faster than the default 0)
  if xinput | grep 'Logitech G400s Optical Gaming Mouse' > /dev/null
  then
    xinput --set-prop 'Logitech G400s Optical Gaming Mouse' 'libinput Accel Speed' 1
  fi
fi

