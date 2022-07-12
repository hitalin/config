EXCLUDE_FILES  = .git .gitmodules .gitignore
INSTALL_TARGET = $(wildcard .??*)
XDG_CONFIGS	   = mpv i3

CONFIG_DIR     = $(HOME)/.config
NVIM_PATH      = $(CONFIG_DIR)/nvim

.PHONY: deploy init

$(CONFIG_DIR):
	mkdir -p $@

$(NVIM_PATH):
	ln -sfnv $(PWD)/nvim $@

deploy: init
	@$(foreach val, $(XDG_CONFIGS), ln -sfnv $(abspath $(val)) $(CONFIG_DIR)/$(val);)

init: $(CONFIG_DIR) $(NVIM_PATH)

uninstall:
	@unlink $(INIT_VIM_PATH)
	@unlink $(NVIM_PATH)
	@$(foreach val, $(XDG_CONFIGS), unlink $(CONFIG_DIR)/$(val);)
