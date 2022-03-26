#!/bin/bash

comfire that your network is well, our process is highly independent it.
you need already install a minimal linux system and install likely base-devel compile tools, maybe you need git to clone this scripts from github.

#install software by pacage manager:

pacman -S xorg-server xorg-apps xorg-xinit fzf neofetch dhcpcd zsh cpupower git 

if [ lspci | grep "wireless card"]
then pacman -s iw wpa_supplicant 
else sleep 1


#compile and install software by sorce code:
     #emacs
     cp srcemacs-* ~/emacs-*
     cd emacs-*
     ./config.json
     make && make install

     #texlive
     cd ~/src/install-tl-20210504/
     ./install-tl 
     
#copy the configure file into home directory:

     cp ~/scripts/.*  ~/


if statement:
     if [ variable test ]
     then
	 commands
     else
	 other commands
     fi


case statement:
    case variable in
        case-1)
              commands ;;
        case-2)
	      commands ;;
        ......
    esac

     
     
