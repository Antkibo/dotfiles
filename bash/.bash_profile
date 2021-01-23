# ~/.bash_profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X server at login on first VT
# (XDG_VTNR only works with systemd)
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startx
fi
