export BROWSER=brave
export QT_QPA_PLATFORMTHEME=qt5ct

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

lxpolkit &
unclutter &
nitrogen --restore &
picom --experimental-backends &
nm-applet --indicator &
easyeffects --gapplication-service &
udiskie --tray &
/usr/lib/geoclue-2.0/demos/agent &
redshift-gtk &

ssh-agent awesome
