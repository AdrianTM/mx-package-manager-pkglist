<?xml version="1.0"?>
<app>

<category>
Browser
</category>

<name>  
Google_Chrome
</name>

<description>  
Latest Google Chrome browser (stable)
</description>

<installable>
64
</installable>

<screenshot>https://www.google.com/chrome/assets/common/images/marquee/chrome-new.jpg</screenshot>

<preinstall>
wget -qO- dl.google.com/linux/chrome/deb/dists/stable/main/binary-$(dpkg --print-architecture)/Packages | grep ^Filename.*google-chrome-stable.*deb | cut -d' ' -f2 | sed 's ^ dl.google.com/linux/chrome/deb/ ' | xargs wget
x-terminal-emulator -e dpkg -i google-chrome-stable*.deb
x-terminal-emulator -e apt-get -f install -y
</preinstall>

<install_package_names>

</install_package_names>


<postinstall>
rm google-chrome-stable*.deb
</postinstall>


<uninstall_package_names>
google-chrome-stable
</uninstall_package_names>
</app>