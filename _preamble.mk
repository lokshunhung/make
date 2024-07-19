SHELL := /bin/bash
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-variables
MAKEFLAGS += --no-builtin-rules
.SUFFIXES:
.DELETE_ON_ERROR:
.SECONDARY:
.SECONDEXPANSION:

ifeq (3.82,$(firstword $(sort $(MAKE_VERSION) 3.82)))
$(warning Makefile written with version 3.81 (bundled with macos sonoma 14.1), running with version $(MAKE_VERSION))
$(warning New features like .ONESHELL .SHELLFLAGS .RECIPEPREFIX can be used, see: https://lists.gnu.org/archive/html/info-gnu/2010-07/msg00023.html)
# .SHELLFLAGS := -o errexit -o nounset -o pipefail -c
# .ONESHELL:
# .RECIPEPREFIX := >
endif

# .DEFAULT_GOAL := default
