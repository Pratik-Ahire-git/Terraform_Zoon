#!/bin/bash
sudo apt update
sudo apt install nginx unzip -y
cd /tmp && wget https://www.free-css.com/assets/files/free-css-templates/download/page295/kider.zip
unzip /tmp/kider.zip
sudo mv /tmp/preschool-website-template /var/www/html/preschool

cd /tmp && wget https://www.free-css.com/assets/files/free-css-templates/download/page296/klinik.zip
unzip /tmp/klinik.zip
sudo mv /tmp/clinic-website-template /var/www/html/clinic