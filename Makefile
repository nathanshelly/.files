# refs
# - https://opensource.com/article/18/8/what-how-makefile
# - https://maex.me/2018/02/dont-fear-the-makefile/
# - http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/

# targets without immediate file dependencies
.PHONY: gui help setup
.DEFAULT_GOAL := help

help:
	@echo 'make help'
	@echo '		show this help message'
	@echo 'make setup'
	@echo '		set up dotfiles'
	@echo 'make symlink'
	@echo '		symlink config files (like .zshrc) to their appropriate locations'
	@echo 'make gui'
	@echo '		set up gui parts of config'

setup:
	./infra/setup/setup_dotfiles

symlink:
	./infra/setup/bin/symlink

gui:
	./gui/setup/setup_gui
