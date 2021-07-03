
# Apk installer

Install a single apk fast with pm

Install multiple apk from a folder, choose to find apk in subfolders or current folder only, if finding in subfolders then specify depth if needed or Install all apks in all subfolders

Install APK for specific architecture, using pm install --abi <armeabi-v7a|arm64-v8a|x86|x86_64> file.apk
Might help for apk which have broken x86

# Archive Extracter
Extract archive/gxp to RAM (tmpfs filesystem at /tmp or /mnt) with 7z cli supporting many archive formats. Because it is extracted to RAM, will extract faster and will be lost after reboot.

# Disable/enable boot animation
Disable boot animation using debug.sf.nobootanimation=1, useful if you want to boot faster, or have ssd which boot the OS before even boot animation finish.

# Boot sound changer
Change gearlock default boot sound to your own from wav file.

# Input device configurator
Android x86 has idc files for some touchpads in /system/usr/idc/ , but not for all touchpads. This is a script which will use cat /proc/bus/input/devices to find Input device name and automatically generate <inputdevicename>.idc file, also allowing you to configure the properties; changing your touchpad behaviour.

# zsh/fish shell
Use zsh/fish shells in alt+f8 console (require termux)
They are more user friendly and have features like auto completion, theming, colors and spelling check.

# modify framework
Extracts the /system/framework/framework-res.apk, then you can modify system UI icons/drawables by yourself and then repack the framework applying new icons/drawables, personalization.




