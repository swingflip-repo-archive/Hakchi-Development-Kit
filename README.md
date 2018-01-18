![Hakchi-Dev-Kit-Logo](https://i.imgur.com/5lqfcvz.png)
# Hakchi Development Kit
This is the Hakchi Development Kit developed by Swingflip for use on Nintendo Mini Super Nintendo. 
## PLEASE NOTE!
This modification has nothing to do with Nintendo nor does it change anything to do with the copyright/legal stuff they have put in place. This mod is to help you develop apps and modifications and help you debug issues with your console and custom apps. Nothing more!

This mod is also USB-HOST only!!! This is due to the potential size of log files that are generated.

### What does it do?

This is a mod which enables strace against the core Nintendo Clover and Canoe applications and dumps the output to your mounted USB drive.

It also dumps the output of any useful internal nintendo test outputs and directs the STDOUT and STDERR for the Nintendo applications.

Lastly it will mount key NAND directories to the USB to make development and modifying a lot easier.

### What does it log?

The following logs are recorded to /media/data/log/ 

- Clover_mcp.log
- Clover_mcp_runtime.log
- Clover_mcp_strace.log
- Clover_ui.log
- Clover_ui_runtime.log
- Clover_ui_strace.log (WARNING - Running this strace will cause C8 errors on button shutdown. You need to throw the power twice or use my shutdown app)
- Foxconn-ftm-audio-test-log.txt
- Foxconn-ftm-cpu-test-log.txt
- Foxconn-ftm-gpu-test-log.txt

### Install instructions

(Before you install make sure you don't have external UI, init, app or usr_bin hmods already installed. If you do, uninstall them. They get installed in the nintendo_dev_kit hmod!)

1. Transfer the nintendo_dev_kit.hmod to your console. (This will mount specific folders to your USB, add configs to your build and do any required ground work)
2. Once you've installed the hmod and the folders are now mounted to your USB. Transfer all the files from the "Step 2 - Custom Dev Files" to the overmount folders on the usb. (Make sure to selec the right region for your console!)

i.e.

copy...

C:\Dev Kit v1.0 RELEASE\Step 2 - Custom Dev Files\EUROPEAN_SET\etc\init.d\S81clover-mcp 

and replace...

D:\hakchi\etc\init.d\S81clover-mcp (usb)

3. (Optional but recommended) Until we release a standalone GUI option menu. Drag over the Dev Kit Options to your hakchi as you would with any normal rom file. These will install option elements to your clover interface which will enable you to enable and disable certain features.

### Things to consider...

- If you run strace against the clover_ui application script. You WILL recieve a C8 error when trying to shut down the console with the physical power button. If this is your only option...When the C8 displays on screen, recycle the power button and it will initiate a shutdown. To overcome this issue, you can use my shutdown app located in my hakchi options pack located on my github. You can also disable the clover_ui strace by using the optional option element within your clover interface.

- If you completely bugger up your overmounts and your console doesn't boot. Don't panic! Just delete the offending folder from your USB. (i.e. /media/hakchi/etc/init.d) Next time you boot it will load a fresh version of the folder on to your USB and boot as normal. If it doesn't just delete all the overmount folders in your hakchi folder on the usb and let your console rebuild the mounts from fresh.

- You can't damage your system using this! Just make sure you back up your custom scripts and modifications regularly incase you mess anything up and need to rebuild the overmounts. (I've done this plenty of times!)

- If you want to create your own external USB overmount hmods be very careful to not overmount /var/lib/hakchi/ Otherwise you will overmount your overmount and it's bad news. It will most likely corrupt that part of your USB and you will need to grab the stuff off it, do a slow format and put stuff back on it. It's a pain so don't do it.

### Uninstall instructions

I reccomend dropping a uninstall file in your transfer folder with just the word "all" (no speech marks) in the file. This will uninstall ALL of your hmods so you will need to install your standard set of hmods but it will ensure that nothing is left over.

### Shout Outs and Credits

- DanTheMan827 - Thanks for putting up with my dumbass.
- CompCom - What a bae.
- DNA64 (Viral_DNA) - Thanks for the help assembling the hmod!
- SuperAwesome, Advokaten, QuatroKiller, bslenul and the rest of you guys who helped me test it.

### Planned Updates

I am aware having to copy the custom files in step 2 is a pain. I actually had script to automatically copy them over during preinit however it wasn't 100% reliable. I will revisit this at another stage and make it so it automatically installs the custom files ontop of the overmount in one go. Until then You need to copy and paste the files over the overmount folder for now. Sorry!

### Final Note.

As always, take it as face value. It works fine for me and other people seem to use it ok. If you have any issues then hit me up. If you don't like it then don't use it.

You're welcome world.
