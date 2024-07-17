.PHONY: help
help: ##  run `make help target=<target>` for detailed help text
help: ### from_makefile=<Makefile>  print help texts for all targets in <Makefile>
help: ### target=<target>           print detailed help text for <target>
ifdef target
	@[[ -n '$(target)' ]] && { \
	echo 'target: $(target)'; \
	cat $(MAKEFILE_LIST) | \
	grep -E '^(.+)[ ]*:[ ]*###[ ]*([^ =]+=[^ ]+)[ ]+(.+)$$' | \
	while read line; do \
		line=$$(echo $$line | sed -n -E 's/^(.+)[ ]*:[ ]*###[ ]*([^ =]+=[^ ]+)[ ]+(.+)$$/\1###\2###\3/p'); \
		target_name=$$(echo $$line | sed -E 's/^(.*)###(.*)###(.*)$$/\1/'); \
		option_name=$$(echo $$line | sed -E 's/^(.*)###(.*)###(.*)$$/\2/'); \
		description=$$(echo $$line | sed -E 's/^(.*)###(.*)###(.*)$$/\3/'); \
		if [[ "$$target_name" != '$(target)' ]]; then continue; fi; \
		printf '%2s%-24s%2s%s\n' '' "$$option_name" '' "$$description"; \
	done; \
	}
else ifdef from_makefile
	@[[ -n '$(from_makefile)' ]] && { \
	cat $(from_makefile) | \
	grep -E '^(.+)[ ]*:[ ]*##[ ]+(.*)$$' | \
	while read line; do \
		line=$$(echo $$line | sed -E 's/^(.+)[ ]*:[ ]*##[ ]+(.*)$$/\1###\2/'); \
		target_name=$$(echo $$line | sed -E 's/^(.*)###(.*)$$/\1/'); \
		description=$$(echo $$line | sed -E 's/^(.*)###(.*)$$/\2/'); \
		printf '%2s%-12s%2s%s\n' '' "$$target_name" '' "$$description"; \
		\
		target_tmpl=$$(echo $$target_name | sed -n -E 's/^\$$\((.*)\)$$/\1/p'); \
		if [[ -n '$$target_tmpl' ]]; then continue; fi; \
		echo $${!target_tmpl} | tr ' ' '\n' | xargs -I {} printf '%4s- %s\n' '' {}; \
	done; \
	}
else
	@{ \
	echo 'Usage: make [target]'; \
	echo ''; \
	echo 'workspace info:'; \
	echo '  shell = $(shell ps -o comm -p $$$$ | tail +2)'; \
	echo '  make = $(MAKE)'; \
	echo '  make_version = $(MAKE_VERSION)'; \
	echo '  make_features = $(.FEATURES)'; \
	echo ''; \
	$(foreach makefile, $(filter-out %.inc.mk _preamble.mk,$(MAKEFILE_LIST)) $(filter help.inc.mk,$(MAKEFILE_LIST)), \
		echo 'targets ($(makefile)):'; \
		$(MAKE) help from_makefile=$(makefile); \
		echo ''; \
	) \
	}
endif
