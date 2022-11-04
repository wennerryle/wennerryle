#!/bin/bash

[ "$UID" -eq 0 ] || { echo "This script must be run as root."; exit 1;}

path_to_fonts="/usr/local/share/fonts"

mkdir -p $path_to_fonts

echo $'let\'s try to install font\nwrite a font name:'
read font_name

path_to_creating_font="${path_to_fonts}/${font_name}/"

if test -d $path_to_creating_font; then
    echo "it looks like such a font already exists, try to set a different name"
	exit 128 #invalid argument to exit
fi

mkdir -p "${path_to_fonts}/${font_name}/"

cp "${PWD}/$1" "$path_to_creating_font"

fc-cache -v

echo "the font has been installed successfully! it's located in the directory:" 
echo "$path_to_fonts"
