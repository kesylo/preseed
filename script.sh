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
