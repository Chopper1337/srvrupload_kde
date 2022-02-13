#!/bin/bash
target_dir=~/.local/share/kservices5/srvrupload
rm -Rf $target_dir
mkdir $target_dir
cd $target_dir/
wget https://raw.githubusercontent.com/Chopper1337/srvrupload_dolphin/main/srvrupload.desktop
wget https://raw.githubusercontent.com/Chopper1337/srvrupload_dolphin/main/srvrupload.sh
chmod +x $target_dir/*
exit