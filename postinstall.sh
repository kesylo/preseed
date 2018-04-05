#!/bin/bash

# set wallpaper
sudo wget -P ~/ https://raw.githubusercontent.com/kesylo/preseed/master/famocoWallpaper.jpg
sudo gsettings set org.gnome.desktop.background picture-uri file:////home/$USER/famocoWallpaper.jpg


# SSH

sudo apt-get install -y openssh-server openssh-client
sudo apt-get -f install -y
sudo echo -e "\n\n\n" | ssh-keygen -t rsa
sudo chmod 700 ~/.ssh
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPY2fihP7FlbudL7XYJM3v6wnnzLwHm/rDo314oBFG/FQLJhmMcJCVgiqMBkNFWmxFar4m7HM78Hfgt2JXcDn2mRI5lw+xxufrcq9Mh8dr03KSMwVs4xGqUDruAi0rMocmDAbaxk2a2PBeDCSm+Iuvje99TXH1RWAoRLxokn5qo1t8Z86qMCHJBfkbA036B7Z38jOfIXK7ZlfgCzYdxxNFX1MeUjnB5zK/Bpjlb2OgoDofuxSRofUabPGVeRPkkE45esJ6XYCXRVAMtrLscrSDrawwNNvULpvudxZ+QDfwg4Rvuk0Cy1ccnkGhpnQRQ0Mpmjqebn7y5mPKiUk7K7YR famoco@famoco-To-be-filled-by-O-E-M' >> ~/.ssh/authorized_keys
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8IvZyaECJYJY27pZHj0r501dthUbV31c7bdZ0CG0mGt6ry25mHp7d3aI0v38VCAYILtTKkNOL98+GtnfdXkiILAQUANDtBDQSnh+311yJlbJH1/ua4qKL8mGcCAEwxDREmKGFiWpskeieU1cg4vSCZNkyQCbYX7Wr2DlAuC6fE+9OMQPioYW2orfUFDalZ/g73uxHFBAO9tRTbvaMRKverk7hNRYeFt8bUm8ajrDhJFkk8RJW+wiIzh+J8cmORWavV38O5Y3LrlZ4pOq3IxtR7LG25/vbQPNz2VyRnVMKuH2XrXk+8WfluELfZb3rEB6rapulmSGBWf9sjSxkbF1BcnSeU8Z2avUG/co4I5c0uxFLQUaN9YLfaJMPwGsJKyom9cCqNyXMdCXRZT38eySbTslUcrYQbe91UEgNDLnzo0BC88a+EckMRx6dvTRse4YKCs3s8VK3imgHYV/XYM08+AbK1IYfl4sDlPllqWFXRwBRvhp4qk6Et5+hywYsmbVCQYfLZu5Cm7Io+wQSUGltNiSw2Pn5jULOrGKq9QmDMVgoWLarfJ2S62wHIhC6kXwXSIiASP0PxkP14LNXXWIWw0WAD2TBGepDK2ghhO7ZHT1LTY1Av5dmGrPjHCXzUNoVk4H9dQudNlLz09Ofdy3Y5gBRrUGpMPyyo7cPDVCGBw== manuel@deferran.com' >> ~/.ssh/authorized_keys
sudo chmod 600 ~/.ssh/authorized_keys
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo sed -i 's/#   PasswordAuthentication yes/   PasswordAuthentication no/g' /etc/ssh/sshd_config 
sudo sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
sudo ufw allow OpenSSH
sudo apt-get -f install -y
sudo systemctl reload ssh
