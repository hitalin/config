default:        basic alacritty dunst i3 i3blocks ranger rofi xdg-utils systemd
.PHONY: default basic alacritty dunst i3 i3blocks ranger rofi xdg-utils systemd

alacritty:
	- ln -s $(CURDIR)/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

dunst:
	- ln -s $(CURDIR)/dunst/dunstrc ~/.config/dunst/dunstrc

cmus:
	- ln -s $(CURDIR)/cmus/rc ~/.config/cmus/rc
	- ln -s $(CURDIR)/cmus/mycolor.theme ~/.config/cmus/mycolor.theme

i3:
	- ln -s $(CURDIR)/i3/config ~/.config/i3/config

i3blocks:
	- ln -s $(CURDIR)/i3blocks/config ~/.config/i3blocks/config

ranger:
	- ln -s $(CURDIR)/ranger/rc.conf ~/.config/ranger/rc.conf
	- ln -s $(CURDIR)/ranger/rifle.conf ~/.config/ranger/rifle.conf
	- ln -s $(CURDIR)/ranger/colorschemes/mycolor.py ~/.config/ranger/colorschemes/mycolor.py

rofi:
	- ln -s $(CURDIR)/rofi/config.rasi ~/.config/rofi/config.rasi

xdg-utilis:
	- ln -s $(CURDIR)/mimeapps.list ~/.config/mimeapps.list

systemd:
	- ln $(CURDIR)/systemd/user/emacs.service ~/.config/systemd/user/emacs.service
