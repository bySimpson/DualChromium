link1=https://google.com
link2=https://google.com

resx=$(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1)

chromium --kiosk --new-window --window-position=0,0 --user-data-dir="./Documents/Profiles/0" $link1 &

chromium --kiosk --window-position=$(expr $resx - 1),0 --window-size=30,30 --user-data-dir="./Documents/Profiles/1" $link2 &
