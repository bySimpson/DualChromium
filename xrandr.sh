#!/bin/sh
percent=50 # percent of display coverage of first screen

# calculation, do not change!
percent2=$(expr 100 - $percent)
resx=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)
resy=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f2)
pres1=$(expr $resx \* $percent / 100)
pres2=$(expr $resx \* $percent2 / 100)

echo $pres1
echo $pres2

if ! [ -z "$(xrandr --listactivemonitors | grep 'Virtual1~1')" ]; then

	echo "removing screens"
	xrandr --delmonitor Virtual1~1
	xrandr --delmonitor Virtual1~2
	xrandr --fb 2561x1440
	xrandr --fb 2560x1440
fi
echo "setting screens"
xrandr --setmonitor Virtual1~1 $pres1/154x$resy/173+0+0 Virtual1
xrandr --setmonitor Virtual1~2 $pres2/155x$resy/173+$pres1+0 none
xrandr --fb $(expr $resx + 1)x$resy
xrandr --fb "$resx"x"$resy"

