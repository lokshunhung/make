include _preamble.mk *.inc.mk

.DEFAULT_GOAL := default

.PHONY: default
default: help

.PHONY: push
## Push code to git remote
push:
	git push

.PHONY: pull
## Rebase pull from git remote, stash working directory
pull:
	git pull --rebase --autostash
