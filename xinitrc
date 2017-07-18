# xv -root -quit images/background.png
#env LC_CTYPE="en_US.UTF-8" /usr/local/bin/fluxbox
#fbsetroot -gradient Vertical -from red -to black

# Mouse related
xinput --set-prop 10 243 20
xset mouse 100 5
synclient HorizTwoFingerScroll=1
synclient HorizScrollDelta=15
synclient PalmDetect=1
synclient PalmMinWidth=15
synclient PalmMinZ=30
# Faster trackpoint
xinput set-prop /dev/wsmouse "Device Accel Constant Deceleration" 0.35

# Trackpoint scroll
#xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
#xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
#xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

# Keyboard related
xset b off
#xset r rate 190 60
xset r rate 300 30
setxkbmap -layout us,fi -option grp:caps_toggle

# Load extra fonts
xset fp+ /usr/local/share/fonts/ghostscript
xset fp+ /usr/local/share/fonts/noto
xset fp+ /usr/local/share/fonts/roboto
xset fp+ /usr/local/share/fonts/terminus
xset fp+ /usr/local/share/fonts/Hack
xset fp rehash

xmodmap ~/.Xmodmap
/usr/local/libexec/tray-app/sound &

if [ -x /usr/local/bin/dbus-launch -a -z "${DBUS_SESSION_BUS_ADDRESS}" ]; then
	eval `dbus-launch --sh-syntax --exit-with-session`
fi

xsetroot -solid black

# Monitor autosetup
_laptop=eDP1
_primary=DP7
_secondary=DP6

if [ $(xrandr | grep -c " connected") == 2 ]; then
	xrandr --output ${_laptop} --off
	xrandr --output ${_primary} --auto --primary
elif [ $(xrandr | grep -c " connected") == 3 ]; then
	xrandr --output ${_laptop} --off \
	    --output ${_primary} --auto --primary \
	    --output ${_secondary} --auto --rotate right --right-of ${_primary}
fi

# Let the newest chrome work again
#/usr/X11R6/bin/xcompmgr &
/usr/local/bin/compton -b

# Lock screen when away or resuming from suspend
/usr/X11R6/bin/xidle -program "/usr/X11R6/bin/xlock" \
	-timeout 600 &

#exec env LC_CTYPE="en_EN.UTF-8" i3
env LC_CTYPE="en_EN.UTF-8" i3

#kbd us.dvorak
