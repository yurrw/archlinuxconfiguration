#!/bin/bash

#update system
echo "Updating system"
sudo pacman -Syu

#checking if pacaur exists
pacman -Qqe | grep 'pacaur' &> /dev/null
if [ $? == 0 ];then
	echo "Installing cups through pacaur"
	pacaur -S cups cups-pdf cups-filters 
else
	echo "Installing cups through yaourt"
	yaourt -S cups cups-pdf cups-filters 
fi

#enabling cups and adding user to group
sudo systemctl enable org.cups.cupsd
sudo systemctl status org.cups.cupds

sudo gpasswd -a $(whoami) lp
sudo pacman -S foomatic-db foomatic-db-engine wget python-gobject 

pacaur -S hplip
printf '0\nd\ny\nm\ny\n\ny\n' | sudo  hp-setup -i 
echo "PRINTER INSTALLED"
echo "Test page will be printed"
