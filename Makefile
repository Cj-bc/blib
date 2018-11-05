DEPSDIR := 'deps/libblib'
TESTS := $(wildcard $(DEPSDIR)/tests/*.bats) $(wildcard ./tests/*.bats)

test : $(TESTS)
	for ts in $^; do
		echo "testing: $ts"
		bats "$ts" --tap
	done

.PHONY: test
