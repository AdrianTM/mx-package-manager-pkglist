<?xml version="1.0"?>
<app>


<category>
Misc
</category>

<name>  
VirtualBox 5.1 (Oracle)
</name>

<description>  
Virtualbox 5.1 from Oracle.
</description>

<installable>
all
</installable>

<screenshot>https://screenshots.debian.net/screenshots/000/015/010/large.png</screenshot>

<preinstall>
#!/bin/bash
echo \"---- in preprocessing ----\"
echo \"Enabling download.virtualbox.org repository entry in /etc/apt/sources.list.d/various.list\"
sed -i -r '/download.virtualbox.org/ s/^#+//' /etc/apt/sources.list.d/various.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
apt-get update
echo \"---- preprocessing done----\"
</preinstall>

<install_package_names>
virtualbox-5.1
</install_package_names>


<postinstall>
#!/bin/bash
echo \"---Downloading VirtualBox Extenstions---\"
wget http://download.virtualbox.org/virtualbox/$(echo $(vboxmanage -v) | cut -d 'r' -f 1)/Oracle_VM_VirtualBox_Extension_Pack-$(echo $(vboxmanage -v) | cut -d 'r' -f 1)-$(echo $(vboxmanage -v) | cut -d 'r' -f 2).vbox-extpack
vboxmanage extpack install Oracle_VM_VirtualBox_Extension_Pack-$(echo $(vboxmanage -v) | cut -d 'r' -f 1)-$(echo $(vboxmanage -v) | cut -d 'r' -f 2).vbox-extpack --replace
rm -f Oracle_VM_VirtualBox_Extension_Pack-$(echo $(vboxmanage -v) | cut -d 'r' -f 1)-$(echo $(vboxmanage -v) | cut -d 'r' -f 2).vbox-extpack
gpasswd -M $(getent group users | cut -d: -f4) vboxusers
</postinstall>


<uninstall_package_names>
virtualbox-5.1
</uninstall_package_names>

</app>
