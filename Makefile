DEPSDIR := ./deps/libblib
TESTS := $(wildcard $(DEPSDIR)/tests/*.bats) $(wildcard ./tests/*.bats)
BINPATH := /usr/local/bin/blib

ifdef root
  ROOT := $(root)
else
  ROOT := ./Tmproot
endif

test : $(TESTS)
	@LIST="$^"; \
	for t in "$$LIST"; do \
		echo "testing: $$t"; \
		bats "$$t" --tap ; \
	done

.PHONY: test
