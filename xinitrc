# xv -root -quit images/background.png
# pgrep aucat || aucat -l &

#env LC_CTYPE="en_US.UTF-8" /usr/local/bin/fluxbox
#fbsetroot -gradient Vertical -from red -to black

# Mouse related
xinput --set-prop 10 243 20
xset mouse 150 20
synclient HorizTwoFingerScroll=1
synclient PalmDetect=1
synclient PalmMinWidth=15
synclient PalmMinZ=30

# Keyboard related
xset b off
#xset r rate 190 60
xset r rate 300 30
setxkbmap se

fbsetroot -solid black
env LC_CTYPE="en_EN.UTF-8" i3


#kbd us.dvorak
