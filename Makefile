.PHONY: test check

build:
	dune build

utop:
	OCAMLRUNPARAM=b dune utop lib

code:
	-dune build
	code .
	! dune build --watch

test:
	OCAMLRUNPARAM=b dune exec test/main.exe

game:
	dune build
	./_build/default/bin/main.exe