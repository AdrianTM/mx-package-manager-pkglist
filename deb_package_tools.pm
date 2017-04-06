<?xml version="1.0"?>
<app>

<category>
Development
</category>

<name>  
deb packaging tools
</name>

<description>  
tools for creation of deb packages
</description>

<installable>
all
</installable>

<screenshot>none</screenshot>

<preinstall>
#!/bin/bash
echo \"---- in preprocessing ----\"
cp /etc/apt/sources.list.d/debian.list /etc/apt/pbuilder.list
echo \"---- preprocessing done----\"

</preinstall>

<install_package_names>
pbuilder
debian-builder
debhelper
libparse-debcontrol-perl
devscripts
dh-make
fakeroot
build-essential
dpkg-dev
</install_package_names>


<postinstall>
#!/bin/bash
echo \"---- in postprocessing ----\"
rm -f /etc/apt/pbuilder.list
echo \"---- postprocessing done----\"
</postinstall>


<uninstall_package_names>
pbuilder
debian-builder
debhelper
libparse-debcontrol-perl
devscripts
dh-make
fakeroot
dpkg-dev
</uninstall_package_names>
</app>