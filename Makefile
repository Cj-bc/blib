DEPSDIR := 'deps/libblib'
TESTS := $(wildcard $(depsdir)/tests/*.bats) $(wildcard tests/*.bats)

test : $(TESTS)
	for ts in $^; do
		echo "testing: $ts"
		bats "$ts" --tap
	done
