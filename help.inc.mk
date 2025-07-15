.PHONY: help
##  run `make help target=<target>` for detailed help text
### from_makefile=<Makefile>  print help texts for all targets in <Makefile>
### target=<target>           print detailed help text for <target>
help:
ifdef target
	@[[ -n '$(target)' ]] \
	&& ./help.sh '$(MAKEFILE_LIST)' -v '$(target)'
else ifdef from_makefile
	@[[ -n '$(from_makefile)' ]] \
	&& ./help.sh '$(from_makefile)'
else
	@{ \
	echo 'Usage: make [target]'; \
	echo ''; \
	tput setaf 2; echo 'workspace info:'; tput sgr0; \
	echo '  shell = $(shell ps -o comm -p $$$$ | tail +2)'; \
	echo '  make = $(MAKE)'; \
	echo '  make_version = $(MAKE_VERSION)'; \
	echo '  make_features = $(.FEATURES)'; \
	echo ''; \
	$(foreach makefile, $(MAKEFILE_LIST), \
	    HELPTEXT="$$($(MAKE) help from_makefile=$(makefile))"; \
		[[ -z "$$HELPTEXT" ]] || { \
		tput setaf 2; echo "targets ($(makefile))"; tput sgr0; \
		echo "$$HELPTEXT"; \
		echo ''; \
		}; \
	) \
	}
endif
