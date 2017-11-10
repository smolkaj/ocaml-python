INSTALL_ARGS := $(if $(PREFIX),--prefix $(PREFIX),)

build:
	time -p jbuilder build @install

install:
	jbuilder install $(INSTALL_ARGS)

uninstall:
	jbuilder uninstall $(INSTALL_ARGS)

reinstall: uninstall reinstall

clean:
	jbuilder clean

doc:
	jbuilder build @doc

test: build install
	ocaml-python

all: build test doc

.PHONY: build install uninstall reinstall clean doc test all
