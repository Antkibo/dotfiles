setxkbmap -option ctrl:swapcaps
setxkbmap -option ctrl:nocaps
xrdb -merge .Xresources
exec i3
