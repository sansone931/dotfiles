[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

export TERM=alacritty
export BROWSER=brave

export QT_QPA_PLATFORMTHEME=qt5ct

lxpolkit &
unclutter &
~/.fehbg &
picom --experimental-backends &
nm-applet --indicator &
udiskie --tray &
/usr/lib/geoclue-2.0/demos/agent &
redshift-gtk &

eval $(ssh-agent)
exec awesome
