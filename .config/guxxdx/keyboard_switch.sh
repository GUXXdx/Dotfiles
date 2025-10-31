#!/usr/bin/env bash
#
#========================================
#           Keyboard_switch     
#========================================
#    Change the conf from an azerty
#    keyboard to a querty keyboard
#========================================
#    Error 0 -> the path for hyprland  
#    configuration file is wrong
#
#    Error 1 -> keybinding.conf or 
#    input.conf is missing
#
#    Error 2 -> input.conf.us or 
#    input.conf.fr is missing
#
#    Error 3 -> keybinding.conf.us or
#    keybinding.conf.fr is missing
#
#    Error 4 -> Just read the damn script
#========================================

pathConf=~/.config/hypr/conf

# Files check
#----------------------------------------
if [[ !(-d $pathConf) ]]; 
then
    echo -e "\e[1;31;m[Error 0]\e[0m Wrong path for the hyprland configuration file"
    exit 0
fi

if [[ !(-e $pathConf/keybinding.conf && $pathConf/input.conf) ]];
then
    echo -e "\e[1;31;m[Error 1]\e[0m Having trouble finding keybinding.conf or input.conf"
    exit 1
fi

if [[  !(-e $pathConf/input.conf.us || -e $pathConf/input.conf.fr) ]];
then
    echo "cat $pathConf/input.conf.us" 
    echo "cat $pathConf/input.conf.fr" 
    echo -e "\e[1;31;m[Error 2]\e[0m Having trouble finding input.conf.us or input.conf.fr"
    exit 2
fi

if [[  !(-e $pathConf/keybinding.conf.us || -e $pathConf/keybinding.conf.fr) ]];
then
    echo -e "\e[1;31;m[Error 3]\e[0m Having trouble finding keybinding.conf.us or keybinding.conf.fr"
    exit 3
fi
#---------------------------------------- 

if [[ (-e $pathConf/keybinding.conf.us && -e $pathConf/input.conf.us) ]]; 
then
    mv $pathConf/keybinding.conf $pathConf/keybinding.conf.fr
    mv $pathConf/input.conf $pathConf/input.conf.fr

    mv $pathConf/keybinding.conf.us $pathConf/keybinding.conf
    mv $pathConf/input.conf.us $pathConf/input.conf

    echo "fr to us "

    
elif [[ (-e $pathConf/keybinding.conf.fr && -e $pathConf/input.conf.fr) ]]; 
then
    mv $pathConf/keybinding.conf $pathConf/keybinding.conf.us
    mv $pathConf/input.conf $pathConf/input.conf.us

    mv $pathConf/keybinding.conf.fr $pathConf/keybinding.conf
    mv $pathConf/input.conf.fr $pathConf/input.conf

    echo "us to fr "

else
    echo -e "\e[1;31;m[Error 4]\e[0m Just read the damn script"
    exit 4
fi

hyprctl reload

