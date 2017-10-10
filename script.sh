#!/bin/bash

# install vlc
sudo apt-get -y install vlc

# Change wallpaper
sudo gsettings set org.gnome.desktop.background picture-uri "https://raw.githubusercontent.com/kesylo/preseed/master/famocoWallpaper.jpg"

#other
sudo wget  -O /tmp/famocoWallpaper.jpg "https://raw.githubusercontent.com/kesylo/preseed/master/famocoWallpaper.jpg"
sudo gsettings set org.gnome.desktop.background picture-uri file:////tmp/famocoWallpaper.jpg


sudo gconftool-2 --type=string --set /desktop/gnome/background/picture_filename /tmp/famocoWallpaper.jpg
sudo gconftool-2 --type=string --set /desktop/gnome/background/picture_options stretched    # stretch the image

#Chrome
cd /tmp
sudo apt-get -y install gdebi
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi -n google-chrome-stable_current_amd64.deb

#Slack
cd /tmp/
wget "https://downloads.slack-edge.com/linux_releases/slack-desktop-2.8.1-amd64.deb"
sudo apt-get install ./slack-desktop-2.8.1-amd64.deb

#Skype
sudo wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg --add-architecture i386
sudo apt-get update
sudo dpkg -i skypeforlinux-64.deb

#Open office
cd /tmp
sudo apt-get -y remove libreoffice* openoffice*
sudo apt-get -y purge -f libreoffice*
sudo apt-get -y autoremove
sudo wget sourceforge.net/projects/openofficeorg.mirror/files/4.1.1/binaries/en-GB/Apache_OpenOffice_4.1.1_Linux_x86-64_install-deb_en-GB.tar.gz
sudo tar -xzvf Apache_OpenOffice_4.1.1_Linux_x86-64_install-deb_en-GB.tar.gz
cd en-GB/DEBS
sudo dpkg -i *.deb
cd desktop-integration
sudo dpkg -i *.deb
