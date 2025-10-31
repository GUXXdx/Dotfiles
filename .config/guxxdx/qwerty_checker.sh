#!/usr/bin/env bash
#
#=======================================
#           Qwerty_checker.sh           
#=======================================
#   Scritp who check if the keyboard
#   layout is in qwerty and change it 
#
#   Prevent to lock the computer in
#   qwerty and to prevent me to log in
#=======================================
#    Error 0 -> the path for hyprland
#    configuration file is wrong
#========================================

pathConf=~/.config/hypr/conf

# Files check
#----------------------------------------
if [[ !(-d $pathConf) ]];
then
    echo -e "\e[1;31;m[Error 0]\e[0m Wrong path for the hyprland configuration file"
    exit 0
fi


if [[ (-e $pathConf/input.conf.fr) ]];
then
    mv $pathConf/keybinding.conf $pathConf/keybinding.conf.us
    mv $pathConf/input.conf $pathConf/input.conf.us

    mv $pathConf/keybinding.conf.fr $pathConf/keybinding.conf
    mv $pathConf/input.conf.fr $pathConf/input.conf

    echo "change " 
fi

hyprctl reload
