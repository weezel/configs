#!/bin/sh

mousedev=$(find /sys/devices/platform/i8042 -name name \
	| xargs grep -Fl TrackPoint \
	| sed 's/\/input\/input[0-9]*\/name$//')

echo 255 | sudo tee ${mousedev}
echo 200 | sudo tee ${mousedev}
