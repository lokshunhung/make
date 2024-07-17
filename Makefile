include _preamble.mk *.inc.mk

.DEFAULT_GOAL := default

.PHONY: default
default: help

.PHONY: push
push: ## push code to git remote
	git push

.PHONY: pull
pull: ## rebase pull from git remote, stash working directory
	git pull --rebase --autostash
