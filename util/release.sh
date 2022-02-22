#!/bin/bash

export BUILD=`pwd`

if [ $1 = "build" ]; then
    cd ~/Documents/Projects/blokk/ && flutter build ios
fi
cd $BUILD

# Create directories
mkdir Blokk
mkdir ./Blokk/DEBIAN
mkdir ./Blokk/Applications

# Create files
touch ./Blokk/DEBIAN/debian-binary
touch ./Blokk/DEBIAN/control
touch ./Blokk/DEBIAN/postinst

# Write to files

## debian-binary
echo "2.0" > ./Blokk/DEBIAN/debian-binary

## postinst
echo "#!/bin/bash" > ./Blokk/DEBIAN/postinst
echo "chmod 6777 /Applications/Blokk.app/Blokk" >> ./Blokk/DEBIAN/postinst
echo "chown root:admin /Applications/Blokk.app/Blokk" >> ./Blokk/DEBIAN/postinst
echo "uicache" >> ./Blokk/DEBIAN/postinst
chmod +x ./Blokk/DEBIAN/postinst

## control
echo "Name: Blokk" > ./Blokk/DEBIAN/control
echo "Package: me.jdiggity.blokk" >> ./Blokk/DEBIAN/control 
echo "Priority: optional" >> ./Blokk/DEBIAN/control
echo "Depends: firmware (>= 12.0)" >> ./Blokk/DEBIAN/control
echo "Conflicts:" >> ./Blokk/DEBIAN/control
echo "Version: 1.0.0" >> ./Blokk/DEBIAN/control
echo "Architecture: iphoneos-arm" >> ./Blokk/DEBIAN/control
echo "Description: Block alphanumeric senders in iMessage. For iOS >= 12.0" >> ./Blokk/DEBIAN/control
echo "Homepage: https://github.com/TheNightmanCodeth/blokk" >> ./Blokk/DEBIAN/control
echo "Depiction: " >> ./Blokk/DEBIAN/control
echo "Maintainer: Joe Diragi <joyod3@gmail.com>" >> ./Blokk/DEBIAN/control
echo "Author: Joe Diragi <joyod3@gmail.com>" >> ./Blokk/DEBIAN/control
echo "Section: Utilities" >> ./Blokk/DEBIAN/control
echo "Tag:" >> ./Blokk/DEBIAN/control
echo "Installed-Size:" >> ./Blokk/DEBIAN/control
echo "dev: TheNightmanCodeth" >> ./Blokk/DEBIAN/control
echo "Icon: file:///Applications/Blokk.app/AppIcon57x57.png" >> ./Blokk/DEBIAN/control

# Move .app into place
cp -r ~/Documents/Projects/blokk/build/ios/Release-iphoneos/Blokk.app ./Blokk/Applications/

export COPYFILE_DISABLE
export COPY_EXTENDED_ATTRIBUTES_DISABLE

dpkg-deb -b Blokk
