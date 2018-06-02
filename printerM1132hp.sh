#!/bin/bash
export red='\033[1;31m'
export NC='\033[0m'
#nocolor nc
export green='\033[0;32m' 

#update system
echo -e  "${green}Updating system${NC}"
#sudo pacman -Syu

#checking if pacaur exists
echo -e "${green}Using pacaur or yaourt${NC}"
pacman -Qqe | grep 'pacaur' &> /dev/null
if [ $? == 0 ];then
	echo -e "--Installing cups through pacaur"
#	pacaur -S cups cups-pdf cups-filters 
else
	echo -e "--Installing cups through yaourt"
#	yaourt -S cups cups-pdf cups-filters 
fi

#enabling cups and adding user to group
echo -e "${green}Enabling cups${NC}"
#sudo systemctl enable org.cups.cupsd
#sudo systemctl status org.cups.cupds

#sudo gpasswd -a $(whoami) lp
#sudo pacman -S foomatic-db foomatic-db-engine wget python-gobject 

#pacaur -S hplip

#printf '0\nd\ny\nm\ny\n\ny\n' | sudo  hp-setup -i 
echo -e  "${green}PRINTER INSTALLED${NC}"
echo "Test page will be printed"
echo "To remove a printer just run : sudo lpadmin -x PrinterName"
echo "To manage printer and spooler  just access cups on: http://localhost:631/"

