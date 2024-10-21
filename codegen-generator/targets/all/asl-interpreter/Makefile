################################################################
# ASL Makefile
#
# Copyright Arm Limited (c) 2017-2019
# SPDX-Licence-Identifier: BSD-3-Clause
################################################################

.DEFAULT: all

VERSION = 0.2.0

build::
	dune build

install::
	dune build @install
	dune install

uninstall::
	dune build @install
	dune uninstall

publish::
	dune build @install
	opam publish https://github.com/alastairreid/asl-interpreter/archive/$(VERSION).tar.gz

doc::
	dune build @doc-private
	@echo Documentation is in _build/default/_doc/_html/libASL*/LibASL/index.html

clean::
	$(RM) *~
	dune clean

################################################################
# End
################################################################
