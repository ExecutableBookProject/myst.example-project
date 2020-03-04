# Minimal makefile for Sphinx documentation
# This Makefile default is to compile for myst-parser. There is
# an RST option available for comparison

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
# MD
SOURCEDIR     = source
BUILDDIR      = _build
# RST
SOURCEDIR_RST = source_rst
BUILDDIR_RST  = _build_rst

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

#-RST-#
rst-clean:
	rm -r $(BUILDDIR_RST)

rst-html:
	@$(SPHINXBUILD) -M html "$(SOURCEDIR_RST)" "$(BUILDDIR_RST)" $(SPHINXOPTS) $(O)

rst-preview:
	cd $(BUILDDIR_RST)/html && python -m http.server

#-MYST-#
preview:
	cd $(BUILDDIR)/html && python -m http.server

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
