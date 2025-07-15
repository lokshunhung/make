.PHONY: --force
--force: ;

## Print Makefile variable
### Example: make print:MAKEFILE_LIST
print\:%: --force
	@echo $*=$($*)
	@echo '  origin = $(origin $*)'
	@echo '  flavor = $(flavor $*)'
	@echo '  value  = $(value $*)'
