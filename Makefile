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

install : blib.oo.sh deps/libblib tests
	[ -d "$(ROOT)" ] || { echo "Making directory..."; mkdir "$(ROOT)"; }; \
	cp -r $^ $(ROOT)/ ;\
	{ cd $(ROOT); \
	: modify path; \
	vim +'%s#$$( cd "$${BASH_SOURCE\[0\]%\/\*}" && pwd )#$(ROOT)#g' +w! +q blib.oo.sh >/dev/null; \
	: install blib itself; \
	mv blib.oo.sh blib; \
	ln -s $(ROOT)/blib $(BINPATH) 2>/dev/null && echo "Installed" || echo "Fail to make symlink"; }


