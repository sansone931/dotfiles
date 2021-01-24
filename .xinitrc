export TERM=alacritty
export BROWSER=brave

unclutter &
nitrogen --restore &
picom --experimental-backends &
nm-applet --indicator &

eval $(ssh-agent)
exec awesome
