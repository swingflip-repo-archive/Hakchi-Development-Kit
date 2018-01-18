#!/bin/sh
#Thanks Dan for the idea.
source /etc/preinit
script_init

pwd="$(dirname "$0")" #Current directory

if [ "$cfg_toggle_dev_kit" != "1" ]; then
  echo "Dev Kit Config - Toggled Dev Kit Mode ON" >> /media/data/log/dev_kit_config.log
  cfg_toggle_dev_kit=1
  xz -dc "$pwd/enabled.png.xz" > /dev/fb0
else
  echo "Dev Kit Config - Toggled Dev Kit Mode OFF" >> /media/data/log/dev_kit_config.log
  cfg_toggle_dev_kit=0
  xz -dc "$pwd/disabled.png.xz" > /dev/fb0
fi

save_config

sleep 2 #let's see that sexy framebuffer a bit longer...

reboot