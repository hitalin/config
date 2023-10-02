EXCLUDE_FILES  = .git .gitmodules .gitignore .DS_Store README.md avatar.png set.sh Makefile config
INSTALL_TARGET = $(wildcard ??*)
XDG_CONFIGS	   = $(filter-out $(EXCLUDE_FILES), $(INSTALL_TARGET))
CONFIG_DIR     = $(HOME)/.config

.PHONY: init deploy uninstall list

$(CONFIG_DIR):
	mkdir -p $@

init: $(CONFIG_DIR)

deploy: init
	@$(foreach val, $(XDG_CONFIGS), ln -sfnv $(abspath $(val)) $(CONFIG_DIR)/$(val);)

uninstall:
	@$(foreach val, $(XDG_CONFIGS), unlink $(CONFIG_DIR)/$(val);)

list:
	@$(foreach val, $(XDG_CONFIGS), /bin/ls -dF $(val);)
