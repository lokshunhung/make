.PHONY: --force
--force: ;

print\:%: ## print Makefile variable
print\:%: --force
	@echo $*=$($*)
	@echo '  origin = $(origin $*)'
	@echo '  flavor = $(flavor $*)'
	@echo '  value  = $(value $*)'
