#!/bin/sh
#Thanks Dan for the idea.
source /etc/preinit
script_init

pwd="$(dirname "$0")" #Current directory

if [ "$cfg_toggle_strace_clover_ui" != "1" ]; then
  echo "Dev Kit Config - Toggled STRACE on Clover-UI to ON" >> /media/data/log/dev_kit_config.log
  cfg_toggle_strace_clover_ui=1
  find /media/hakchi/usr/share/applications/clover-ui.menu.desktop -type f -exec sed -i 's/Exec=\/usr\/bin\/clover-ui/Exec=\/bin\/strace -o \/media\/data\/log\/clover_ui_strace.log \/usr\/bin\/clover-ui/g' {} \;
  xz -dc "$pwd/enabled.png.xz" > /dev/fb0
else
  echo "Dev Kit Config - Toggled STRACE on Clover-UI to OFF" >> /media/data/log/dev_kit_config.log
  cfg_toggle_strace_clover_ui=0
  find /media/hakchi/usr/share/applications/clover-ui.menu.desktop -type f -exec sed -i 's/Exec=\/bin\/strace -o \/media\/data\/log\/clover_ui_strace.log \/usr\/bin\/clover-ui/Exec=\/usr\/bin\/clover-ui/g' {} \;
  xz -dc "$pwd/disabled.png.xz" > /dev/fb0
fi

save_config

sleep 2 #let's see that sexy framebuffer a bit longer...

reboot