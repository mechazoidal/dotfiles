#xset +fp /usr/local/share/fonts/ghostscript/
#xset +fp /usr/local/share/fonts/Droid/
#xset +fp /usr/local/share/fonts/terminus/
#xset +fp /usr/local/share/fonts/Inconsolata/
xset +fp /usr/local/share/fonts/ghostscript/
xset +fp /usr/local/share/fonts/noto/
xset +fp /usr/local/share/fonts/terminus/
xset +fp /usr/local/share/fonts/inconsolata/
xset fp rehash

xrdb -merge $HOME/.Xdefaults

#setxkbmap -option ctrl:swapcaps
#setxkbmap -option ctrl:nocaps
#setxkbmap -option ctrl:nocaps altwin:meta_win
setxkbmap -option -option ctrl:nocaps
# WARNING: NEITHER meta_win or left_meta_win WILL WORK, KEYS BECOME NONRESPONSIVE
#setxkbmap -option -option ctrl:nocaps altwin:left_meta_win
#altwin:left_meta_win

eval $(ssh-agent)

xscreensaver &

dstat iwm0 &

exec dwm
