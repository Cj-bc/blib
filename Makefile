ifdef root
  ROOT := $(root)
else
  ROOT := /usr/local/etc/blib
endif

DEPSDIR := $(ROOT)/lib
TESTS := $(wildcard $(DEPSDIR)/**/tests/*.bats) $(wildcard ./tests/*.bats)
BINPATH := /usr/local/bin/blib

test : $(TESTS)
	@LIST="$^"; \
	for t in "$$LIST"; do \
		echo "testing: $$t"; \
		bats "$$t" --tap ; \
	done

install : blib.oo.sh deps/libblib deps/bash-oo-framework tests
	[ -L "$(BINPATH)" -o -f "$(BINPATH)" ] && { echo "Already installed. Aborting" >&2; exit;}; \
	[ -d "$(ROOT)" ] || { echo "Making directory..."; mkdir "$(ROOT)"; }; \
	[ -d "$(ROOT)/lib" ] || { echo "Making directory..."; mkdir "$(ROOT)/lib"; }; \
	echo "Copying files..."; \
	cp -r deps/libblib deps/bash-oo-framework $(ROOT)/lib; \
	cp -r blib.oo.sh tests $(ROOT);\
	{ cd $(ROOT); \
	: modify path; \
	vim +'%s#$$( cd "$${BASH_SOURCE\[0\]%\/\*}" && pwd )\/deps#$(ROOT)\/lib#g' +w! +q blib.oo.sh >/dev/null 2>&1; \
	: install blib itself; \
	mv blib.oo.sh blib; \
	ln -s $(ROOT)/blib $(BINPATH) 2>/dev/null && echo "Installed" || echo "Fail to make symlink"; }



uninstall :
	[ -d "$(ROOT)" -a -f "$(ROOT)/blib" ] || { echo "Not installed. Aborting" >&2; exit; }; \
	echo "unlinking..."; \
	unlink $(BINPATH); \
	echo "removing..."; \
	rm -rf $(ROOT) && echo "Uninstalled." || echo "failed to uninstall";



.PHONY: test install uninstall
