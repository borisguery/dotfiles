#!/usr/bin/env bash

PACKAGE_VERSION=(
    "facter:1.7.2"
    "hiera:1.2.1"
    "hiera-puppet:1.0.0"
    "puppet:3.2.4"
)

PACKAGE_VOLUME_TARGET="/"

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "error: Must be run as root or using sudo"
    exit 1
fi

for package in "${PACKAGE_VERSION[@]}"; do
    package_name=${package%%:*}
    version=${package#*:}
    TMPFILE=`mktemp /tmp/puppet_install.XXXXXXXXX`
    echo "Downloading $package_name ($version)..."
    curl -L --progress http://downloads.puppetlabs.com/mac/$package_name-$version.dmg > $TMPFILE  
    echo "Mouting image..."
    hdiutil attach -quiet $TMPFILE
    PACKAGE_INSTALLER=$(sudo find /Volumes/$package_name-$version/ -name "*.pkg" | head -n1)
    echo "Installing $package_name ($version)..."
    installer -pkg $PACKAGE_INSTALLER -target $PACKAGE_VOLUME_TARGET 1> /dev/null 
    hdiutil detach -quiet /Volumes/$package_name-$version
    echo "" # New line for the sake of readability :)
done
