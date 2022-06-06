# DualChromium
Using this project you can start two fullscreen chromium tabs with custom resolution on startup.

## Installation
```
git clone https://github.com/bySimpson/DualChromium.git
cd DualChromium
./install.sh
```

## Usage
You can set the resolution of the left chromium instance by changing the percent variable in xrandr.sh.

To change the opened webpages, change link1 and link2 in start-chromium.sh.

## Notes for Rasperry Pi 4
You cannot use vc4-kms-v3d graphic drivers, which are enable by default since the introduction of 64Bit images. This change is needed if you want to boot the rasperry pi with no connected monitor at boot time.

### Change the following options in /boot/options.txt:
```
hdmi_force_hotplug=1
hdmi_group=1
hdmi_mode=16 # 16=full-hd, 95=4k
hdmi_drive=2
dtoverlay=vc4-fkms-v3d
```
