#!/bin/bash
  
# Update
sudo apt-get -y update

# Basics
sudo apt install net-tools

# open VPN
sudo apt-get -y install openvpn easy-rsa

# skype
sudo wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg --add-architecture i386
sudo dpkg -i skypeforlinux-64.deb
sudo apt-get install -f
sudo dpkg -i skypeforlinux-64.deb

# VLC
sudo apt-get -y update
sudo apt-get -y install vlc

# chrome
cd /tmp
sudo apt-get -y install gdebi
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo gdebi -n google-chrome-stable_current_amd64.deb

# OpenOffice
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
# SSH
sudo apt-get install -y openssh-server
sudo echo -e "\n\n\n" | ssh-keygen -t rsa
sudo chmod 700 ~/.ssh
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPY2fihP7FlbudL7XYJM3v6wnnzLwHm/rDo314oBFG/FQLJhmMcJCVgiqMBkNFWmxFar4m7HM78Hfgt2JXcDn2mRI5lw+xxufrcq9Mh8dr03KSMwVs4xGqUDruAi0rMocmDAbaxk2a2PBeDCSm+Iuvje99TXH1RWAoRLxokn5qo1t8Z86qMCHJBfkbA036B7Z38jOfIXK7ZlfgCzYdxxNFX1MeUjnB5zK/Bpjlb2OgoDofuxSRofUabPGVeRPkkE45esJ6XYCXRVAMtrLscrSDrawwNNvULpvudxZ+QDfwg4Rvuk0Cy1ccnkGhpnQRQ0Mpmjqebn7y5mPKiUk7K7YR famoco@famoco-To-be-filled-by-O-E-M' >> ~/.ssh/authorized_keys
sudo echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC8IvZyaECJYJY27pZHj0r501dthUbV31c7bdZ0CG0mGt6ry25mHp7d3aI0v38VCAYILtTKkNOL98+GtnfdXkiILAQUANDtBDQSnh+311yJlbJH1/ua4qKL8mGcCAEwxDREmKGFiWpskeieU1cg4vSCZNkyQCbYX7Wr2DlAuC6fE+9OMQPioYW2orfUFDalZ/g73uxHFBAO9tRTbvaMRKverk7hNRYeFt8bUm8ajrDhJFkk8RJW+wiIzh+J8cmORWavV38O5Y3LrlZ4pOq3IxtR7LG25/vbQPNz2VyRnVMKuH2XrXk+8WfluELfZb3rEB6rapulmSGBWf9sjSxkbF1BcnSeU8Z2avUG/co4I5c0uxFLQUaN9YLfaJMPwGsJKyom9cCqNyXMdCXRZT38eySbTslUcrYQbe91UEgNDLnzo0BC88a+EckMRx6dvTRse4YKCs3s8VK3imgHYV/XYM08+AbK1IYfl4sDlPllqWFXRwBRvhp4qk6Et5+hywYsmbVCQYfLZu5Cm7Io+wQSUGltNiSw2Pn5jULOrGKq9QmDMVgoWLarfJ2S62wHIhC6kXwXSIiASP0PxkP14LNXXWIWw0WAD2TBGepDK2ghhO7ZHT1LTY1Av5dmGrPjHCXzUNoVk4H9dQudNlLz09Ofdy3Y5gBRrUGpMPyyo7cPDVCGBw== manuel@deferran.com' >> ~/.ssh/authorized_keys
sudo chmod 600 ~/.ssh/authorized_keys
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config 
sudo sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
sudo ufw allow OpenSSH
sudo ufw enable
sudo systemctl reload ssh

# Fusion Inventory
sudo apt -y install dmidecode hwdata ucf hdparm
sudo apt -y install perl libuniversal-require-perl libwww-perl libparse-edid-perl
sudo apt -y install libproc-daemon-perl  libproc-pid-file-perl libfile-which-perl
sudo apt -y install libxml-treepp-perl libyaml-perl libnet-cups-perl libnet-ip-perl
sudo apt -y install libdigest-sha-perl libsocket-getaddrinfo-perl libtext-template-perl
sudo apt -y install nmap libnet-snmp-perl libcrypt-des-perl libnet-nbname-perl
sudo apt -y install libfile-copy-recursive-perl libparallel-forkmanager-perl
cd /tmp/
sudo wget "http://debian.fusioninventory.org/downloads/fusioninventory-agent_2.3.21-2_all.deb"
sudo dpkg -i fusioninventory-agent_2.3.21-2_all.deb
sudo sed -i 's/delaytime = 3600/delaytime = 30/g' /etc/fusioninventory/agent.cfg
sudo sed -i 's/lazy = 0/lazy = 30/g' /etc/fusioninventory/agent.cfg
sudo sed -i 's/MODE=cron/MODE=daemon/g' /etc/default/fusioninventory-agent
sudo sed -i 's@#server = http://server.domain.com/glpi/plugins/fusioninventory/@server = https://glpi.dev.famoco.com/plugins/fusioninventory/@g' /etc/fusioninventory/agent.cfg
sudo systemctl restart fusioninventory-agent
sudo pkill -USR1 -f -P 1 fusioninventory-agent
sudo systemctl start fusioninventory-agent

# vim: expandtab shiftwidth=2 tabstop=2
