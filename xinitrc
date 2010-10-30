# xv -root -quit images/background.png
# pgrep aucat || aucat -l &
xset b off
xset r rate 250 80
#env LC_CTYPE="en_US.UTF-8" /usr/local/bin/fluxbox
fbsetroot -gradient Vertical -from grey -to black
env LC_CTYPE="en_EN.UTF-8" scrotwm
#exec /usr/X11R6/bin/fvwm
