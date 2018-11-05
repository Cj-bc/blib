DEPSDIR := 'deps/libblib'
TESTS := $(wildcard $(DEPSDIR)/tests/*.bats) $(wildcard ./tests/*.bats)

test : $(TESTS)
	@LIST="$^"; \
	for t in "$$LIST"; do \
		echo "testing: $$t"; \
		bats "$$t" --tap ; \
	done

.PHONY: test
