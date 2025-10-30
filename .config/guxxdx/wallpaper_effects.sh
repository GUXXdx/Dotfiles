#!/usr/bin/env bash

#current_wallpaper_path=$(swww query | head -n 1 | awk -F"image: " "/image:/ {print $2}")
current_wallpaper_path=$(swww query | grep "image:" | sed -E 's/.*image: (.*)/\1/')
destination_wallpaper_dir="$HOME/.cache/swww"
mkdir -p "$destination_wallpaper_dir"

rm -f "$destination_wallpaper_dir/normal.png"
vipsthumbnail "$current_wallpaper_path" -o "$destination_wallpaper_dir/normal.png[compression=0]" --size 1920x1080 --linear
