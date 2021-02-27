# refs
# - https://opensource.com/article/18/8/what-how-makefile
# - https://maex.me/2018/02/dont-fear-the-makefile/
# - http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/

# targets without immediate file dependencies
.PHONY: all check fix format gui help lint nix headless-setup setup
.DEFAULT_GOAL := help

lint:
	./infra/actions/shellcheck

format:
	./infra/actions/shfmt -w -s # write to file, simplify code

check: lint
	./infra/actions/shfmt -d # error on diff

fix: format
	./infra/actions/shellcheck --fix

headless-setup:
	./infra/setup/setup_dotfiles --headless

setup:
	./infra/setup/setup_dotfiles

nix:
	./infra/setup/bin/setup_nix

gui:
	./gui/setup/setup_gui

all:
	./infra/setup/setup_dotfiles
	./gui/setup/setup_gui

apply:
	./nix/apply

apply-gui:
	./nix/apply gui

# set up abstractions for me-specific application
n:
	./nix/apply nathan

nw:
	./nix/apply work

help:
	@echo 'make help'
	@echo '		show this help message'
	@echo 'make setup'
	@echo '		set up dotfiles'
	@echo 'make apply'
	@echo '		apply latest config'
	@echo 'make apply-gui'
	@echo '		apply gui config'
	@echo 'make n'
	@echo '		apply Nathan-specific config'
	@echo 'make work'
	@echo '		apply (Nathan & work)-specific config'
	@echo 'make nix'
	@echo '		set up nix'
	@echo 'make gui'
	@echo '		set up gui parts of config'
	@echo 'make all'
	@echo '		set up terminal & gui parts of config'
	@echo 'make lint'
	@echo '		lint (shellcheck)'
	@echo 'make format'
	@echo '		format (shfmt)'
	@echo 'make check'
	@echo '		run lint & formatting checks'
	@echo 'make fix'
	@echo '		format & apply any lint fixes'
