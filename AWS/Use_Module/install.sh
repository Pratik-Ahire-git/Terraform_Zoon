#!/bin/bash 

sudo apt update 

sudo apt install nginx unzip -y 

cd /tmp 

wget https://www.free-css.com/assets/files/free-css-templates/download/page294/woody.zip

wget https://www.free-css.com/assets/files/free-css-templates/download/page291/gamepad.zip

unzip woody.zip 

unzip gamepad.zip

sudo mv carpenter-website-template/ /var/www/html/woody

sudo mv html/ /var/www/html/gamepad