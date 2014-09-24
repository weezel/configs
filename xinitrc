# xv -root -quit images/background.png
# pgrep aucat || aucat -l &

#env LC_CTYPE="en_US.UTF-8" /usr/local/bin/fluxbox
#fbsetroot -gradient Vertical -from red -to black

# Mouse related
xinput --set-prop 10 243 20
xset mouse 100 5
synclient HorizTwoFingerScroll=1
synclient PalmDetect=1
synclient PalmMinWidth=15
synclient PalmMinZ=30

# Keyboard related
xset b off
#xset r rate 190 60
xset r rate 300 30
setxkbmap -layout fi,us -option grp:caps_toggle

xmodmap ~/.Xmodmap
/usr/local/libexec/tray-app/sound &

#if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
#	eval `dbus-launch --sh-syntax --exit-with-session`
#fi

xsetroot -solid black

if [ $(xrandr | grep " connected" | wc -l) == 2 ]; then
	xrandr --output LVDS1 --off
	xrandr --output HDMI1 --auto
fi

env LC_CTYPE="en_EN.UTF-8" i3


#kbd us.dvorak
