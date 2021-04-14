default:        basic pandoc alacritty dunst cmus mpd ncmpcpp sway i3 i3blocks gtk-3.0 ranger rofi zathura
.PHONY: default basic pandoc alacritty dunst cmus mpd ncmpcpp sway i3 i3blocks gtk-3.0 ranger rofi zathura

pandoc:
	- ln -s $(CURDIR)/pandoc/templates/mytemplate.latex ~/.config/pandoc/templates/mytemplate.latex
	- ln -s $(CURDIR)/pandoc/templates/mytemplate.beamer ~/.config/pandoc/templates/mytemplate.beamer

alacritty:
	- ln -s $(CURDIR)/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

dunst:
	- ln -s $(CURDIR)/dunst/dunstrc ~/.config/dunst/dunstrc

cmus:
	- ln -s $(CURDIR)/cmus/rc ~/.config/cmus/rc
	- ln -s $(CURDIR)/cmus/mycolor.theme ~/.config/cmus/mycolor.theme

mpd:
	- ln -s $(CURDIR)/mpd/mpd.conf ~/.config/mpd/mpd.conf

ncmpcpp:
	- ln -s $(CURDIR)/ncmpcpp/config ~/.config/ncmpcpp/config
	- ln -s $(CURDIR)/ncmpcpp/key ~/.config/ncmpcpp/keys

sway:
	- ln -s $(CURDIR)/sway/config ~/.config/sway/config

i3:
	- ln -s $(CURDIR)/i3/config ~/.config/i3/config

i3blocks:
	- ln -s $(CURDIR)/i3blocks/config ~/.config/i3blocks/config

gtk-3.0:
	- ln -s $(CURDIR)/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

ranger:
	- ln -s $(CURDIR)/ranger/rc.conf ~/.config/ranger/rc.conf
	- ln -s $(CURDIR)/ranger/rifle.conf ~/.config/ranger/rifle.conf
	- ln -s $(CURDIR)/ranger/colorschemes/mycolor.py ~/.config/ranger/colorschemes/mycolor.py

rofi:
	- ln -s $(CURDIR)/rofi/config.rasi ~/.config/rofi/config.rasi

zathura:
	- ln -s $(CURDIR)/zathura/zathurarc ~/.config/zathura/zathurarc
