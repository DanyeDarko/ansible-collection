#!/bin/bash

reset

banner_size(){
   echo
   echo "+----------------------------------------------------------+"
   echo "| No |  Memory |   vCPUs  |  SSD Disk | Transfer |  Price  |"
   echo "|----------------------------------------------------------+"
   echo "|  1 |  1 Gb   |  1 vCPU  |   25 Gb   |   1 Tb   |   \$5/mo |"
   echo "|  2 |  2 Gb   |  1 vCPU  |   50 Gb   |   2 Tb   |  \$10/mo |"
   echo "|  3 |  3 Gb   |  1 vCPU  |   60 Gb   |   3 Tb   |  \$15/mo |"
   echo "|  4 |  2 Gb   |  2 vCPU  |   60 Gb   |   3 Tb   |  \$15/mo |"
   echo "|  5 |  1 Gb   |  3 vCPU  |   60 Gb   |   3 Tb   |  \$15/mo |"
   echo "|  6 |  4 Gb   |  2 vCPU  |   80 Gb   |   4 Tb   |  \$20/mo |"
   echo "+----------------------------------------------------------+"
   echo
}

banner_image(){
   echo
   echo "1. Ubuntu 18.04 x64     6.  Fedora 28 x64       11. Centos 7 x64"
   echo "2. Ubuntu 16.04 x64     7.  Fedora 27 x64       12. Centos 6 x64"
   echo "3. Ubuntu 16.04 x32     8.  Debian 9.5 x64      13. Centos 6 x32"
   echo "4. Ubuntu 14.04 x64     9.  Debian 8.1 x64      "
   echo "5. Ubuntu 14.04 x32     10. Debian 8.1 x32      "
   echo
}

banner_region(){
   echo
   echo "1. New York"
   echo "2. Amsterdam"
   echo "3. San Francisco"
   echo "4. Singapore"
   echo "5. London"
   echo
}


echo "Welcome to automate Digital Ocean provisioning"
echo
echo "1. Create new droplet"
echo "2. Destroy droplet"
echo
read -p "Choose your options: " input
if [ "$input" == "1" ]
then
   reset
   banner_size
   read -p "Choose your droplet size [ 1-6 ]: " size
   if [ $size != [1-6] ];then
      echo "Wrong options"
   fi
   reset
   banner_image
   read -p "Choose an image for droplet: " image
   if [ $image != [1-13] ];then
      echo "Wrong options"
   fi
   reset
   banner_region
   read -p "Choose a datacenter region: " region
   if [ $region != [1-5] ];then
      echo "Wrong options"
   fi
   reset
   read -p "FQDN: " fqdn
   read -p "Droplet name: " name
   ansible-playbook -e "fqdn=$fqdn droplet_name=$name do_image=do_image_$image do_size=do_size_$size do_region=do_region_$region" main.yml --tags "create"

elif [ "$input" == "2" ]
then
   read -p "Droplet name: " name
   ansible-playbook -e "droplet_name=$name" main.yml --tags "destroy"

else
   echo "Wrong options."
fi