#!/bin/bash
cd ~
rm -rf ./hp-client-64bit
rm hp-client-64bit.zip
wget https://512mb.org/files/itl_chorus/bin/hp-client-64bit.zip
unzip hp-client-64bit.zip
chmod a+x ./hp-client-64bit/synfone
sudo reboot
