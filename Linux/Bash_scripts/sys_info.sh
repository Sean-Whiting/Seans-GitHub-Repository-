#!/bin/bash

echo "A Quick System Audit Script"
date
echo "7/8/2021"
echo "Machine Type Info:"
echo $MACHTYPE
echo -e "Uname info $(uname -a \n"
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n"
echo "Hostname : $(hostname -s) "
echo "DNS Servers: "
cat /etc/resolve.conf
echo "memory info:"
free 
echo -e "\nCPU Info:"
lscpu | grep CPU
echo -e ""\nDisk Usage:"
df -H | head -2 
echo -e "\nwho is logged in: \n $(who) \n"
