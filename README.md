# ocaml-python: Using Python scripts from OCaml

This is a minimal skeleton demonstrating how to invoke Python scripts from OCaml. 

## Build & Run
Simply execute `make test` to build, install, and run. Or, if you prefer to do things step by step:
1. `make build` to build the package
2. `make install` to install the package using `opam`, OCaml's package manager
3. `ocaml-python` to execute the OCaml binary
To uninstall, execute `make uninstall`.

## Dependencies
At a minimum, the package requires:
* **OCaml**, version 4.05.0 or newer
* **Python 3**, to run the Python script
* **opam**, OCaml's package manager
* **jbuilder**, an OCaml build tool

Additionally, the following OCaml packages must be installed through `opam`:
* **ocamlfind**, to locate the Python script at runtime
* **core**, Jane Street's de facto standard library for OCaml
With `opam` installed, acquiring these packages is as easy as excecuting `opam install ocamlfind core` 

### OS
The package has been tested with Ubuntu and MacOS and should work on all Unix systems.
