# Autostart X at login on vt1
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx -- -ardelay 300 -arinterval 30
fi
