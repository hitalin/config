default:        basic nvim fcitx5 pandoc alacritty dunst cmus mpd ncmpcpp i3 i3blocks gtk-3.0 ranger rofi zathura
.PHONY: default basic nvim fcitx5 pandoc alacritty dunst cmus mpd ncmpcpp i3 i3blocks gtk-3.0 ranger rofi zathura

nvim:
	- mkdir -p $(CURDIR)/nvim ~/.config/nvim
	- mkdir -p $(CURDIR)/nvim ~/.config/nvim/rc
	- mkdir -p $(CURDIR)/nvim ~/.config/nvim/plugins
	- ln -s $(CURDIR)/nvim/init.vim ~/.config/nvim/init.vim
	- ln -s $(CURDIR)/nvim/rc/filetype.rc.vim ~/.config/nvim/rc/filetype.rc.vim
	- ln -s $(CURDIR)/nvim/rc/indent.rc.vim ~/.config/nvim/rc/indent.rc.vim
	- ln -s $(CURDIR)/nvim/rc/settings.rc.vim ~/.config/nvim/rc/settings.rc.vim
	- ln -s $(CURDIR)/nvim/plugins/ale.rc.vim ~/.config/nvim/plugins/ale.rc.vim
	- ln -s $(CURDIR)/nvim/plugins/defx.rc.vim ~/.config/nvim/plugins/defx.rc.vim
	- ln -s $(CURDIR)/nvim/plugins/dein_lazy.toml ~/.config/nvim/plugins/dein_lazy.toml
	- ln -s $(CURDIR)/nvim/plugins/dein.toml ~/.config/nvim/plugins/dein.toml
	- ln -s $(CURDIR)/nvim/plugins/deoplete.rc.vim ~/.config/nvim/plugins/deoplete.rc.vim
	- ln -s $(CURDIR)/nvim/plugins/fzf.rc.vim ~/.config/nvim/plugins/fzf.rc.vim
	- ln -s $(CURDIR)/nvim/plugins/neosnippet.rc.vim ~/.config/nvim/plugins/neosnippet.rc.vim
	- ln -s $(CURDIR)/nvim/plugins/vim-lsp.rc.vim ~/.config/nvim/plugins/vim-lsp.rc.vim
	- ln -s $(CURDIR)/nvim/plugins/vimtex.rc.vim ~/.config/nvim/plugins/vimtex.rc.vim

fcitx5:
	- mkdir -p $(CURDIR)/fcitx5 ~/.config/fcitx5
	- ln -s $(CURDIR)/fcitx5/config ~/.config/fcitx5/config
	- ln -s $(CURDIR)/fcitx5/profile ~/.config/fcitx5/profile

pandoc:
	- mkdir -p $(CURDIR)/pandoc/templates ~/.config/pandoc/templates
	- ln -s $(CURDIR)/pandoc/templates/mytemplate.latex ~/.config/pandoc/templates/mytemplate.latex
	- ln -s $(CURDIR)/pandoc/templates/mytemplate.beamer ~/.config/pandoc/templates/mytemplate.beamer

alacritty:
	- mkdir -p $(CURDIR)/alacritty ~/.config/alacritty
	- ln -s $(CURDIR)/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

dunst:
	- mkdir -p $(CURDIR)/dunst ~/.config/dunst
	- ln -s $(CURDIR)/dunst/dunstrc ~/.config/dunst/dunstrc

cmus:
	- mkdir -p $(CURDIR)/cmus ~/.config/cmus
	- ln -s $(CURDIR)/cmus/rc ~/.config/cmus/rc
	- ln -s $(CURDIR)/cmus/mycolor.theme ~/.config/cmus/mycolor.theme

mpd:
	- mkdir -p $(CURDIR)/mpd ~/.config/mpd
	- ln -s $(CURDIR)/mpd/mpd.conf ~/.config/mpd/mpd.conf

ncmpcpp:
	- mkdir -p $(CURDIR)/ncmpcpp ~/.config/ncmpcpp
	- ln -s $(CURDIR)/ncmpcpp/config ~/.config/ncmpcpp/config
	- ln -s $(CURDIR)/ncmpcpp/key ~/.config/ncmpcpp/keys

i3:
	- mkdir -p $(CURDIR)/i3 ~/.config/i3
	- ln -s $(CURDIR)/i3/config ~/.config/i3/config

#sway:
#	- mkdir -p $(CURDIR)/sway ~/.config/sway
#	- ln -s $(CURDIR)/sway/config ~/.config/sway/config

i3blocks:
	- git clone https://github.com/vivien/i3blocks-contrib ~/.config/i3blocks
	- ln -s $(CURDIR)/i3blocks/config ~/.config/i3blocks/config

#polybar:
#	- mkdir -p $(CURDIR)/polybar ~/.config/polybar
#	- ln -s $(CURDIR)/polybar/config ~/.config/polybar/config
#	- ln -s $(CURDIR)/polybar/launch.sh ~/.config/polybar/launch.sh

gtk-3.0:
	- mkdir -p $(CURDIR)/gtk-3.0 ~/.config/gtk-3.0
	- ln -s $(CURDIR)/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini

ranger:
	- mkdir -p $(CURDIR)/ranger ~/.config/ranger
	- ln -s $(CURDIR)/ranger/rc.conf ~/.config/ranger/rc.conf
	- ln -s $(CURDIR)/ranger/rifle.conf ~/.config/ranger/rifle.conf
	- ln -s $(CURDIR)/ranger/scope.sh ~/.config/ranger/scope.sh
	- mkdir -p $(CURDIR)/ranger/colorschemes ~/.config/ranger/colorschemes
	- ln -s $(CURDIR)/ranger/colorschemes/mycolor.py ~/.config/ranger/colorschemes/mycolor.py

rofi:
	- mkdir -p $(CURDIR)/rofi ~/.config/rofi
	- ln -s $(CURDIR)/rofi/config.rasi ~/.config/rofi/config.rasi

zathura:
	- mkdir -p $(CURDIR)/zathura ~/.config/zathura
	- ln -s $(CURDIR)/zathura/zathurarc ~/.config/zathura/zathurarc
