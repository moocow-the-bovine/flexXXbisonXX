#-----------------------------------------------------------------------
# File: ./Makefile.am
# Package: flex++bison++
# Description:
#   + top-level automake file
#
# Process this file with Automake to create Makefile.in.
#-----------------------------------------------------------------------

#-----------------------------------------------------------------------
# Options & Subdirectories
#-----------------------------------------------------------------------
AUTOMAKE_OPTIONS = foreign dist-bzip2
SUBDIRS = @MY_SUBDIRS@

#-----------------------------------------------------------------------
# Variables: installation (pkg-config)
#-----------------------------------------------------------------------
pkgconfig_DATA = flex++bison++.pc

#-----------------------------------------------------------------------
# Variables: cleanup
#-----------------------------------------------------------------------
CLEANFILES = *~

DISTCLEANFILES = \
	config.log		\
	config.status

MAINTAINERCLEANFILES = \
	$(pkgconfig_DATA) \
	$(PODS:.pod=.txt)     \
	Makefile.in    \
	aclocal.m4     \
	configure

#-----------------------------------------------------------------------
# Variables: PODS
#-----------------------------------------------------------------------
PODS = README.pod

#-----------------------------------------------------------------------
# Variables: distribution
#-----------------------------------------------------------------------
EXTRA_DIST = $(PODS) $(PODS:.pod=.txt) autogen.sh configure

DIST_SUBDIRS = config flex++ bison++ elisp

MY_DIST_DOC = bison++.1.ps  bison.1.ps  bison.ps  flex++.1.ps  flexdoc.1.ps
MY_DIST_MISC = \
	Discussion     MyParser.y   dmanParser.y \
	MyCompiler.cc  MyScanner.l  dmanScanner.l \
	makefile

dist-hook:
	mkdir -p $(distdir)/doc
	for f in $(MY_DIST_DOC) ; do \
	  cp $(srcdir)/doc/$$f $(distdir)/doc ;\
	done
	mkdir -p $(distdir)/misc
	for f in $(MY_DIST_MISC) ; do \
	  cp $(srcdir)/misc/$$f $(distdir)/misc ;\
	done

#-----------------------------------------------------------------------
# Rules: pod2text
#-----------------------------------------------------------------------
SUFFIXES = .pod .txt

.pod.txt:
	pod2text $< $@

#-----------------------------------------------------------------------
# Rules: cleanup & aliases
#-----------------------------------------------------------------------
.PHONY: cvsclean
cvsclean: maintainer-clean ;

dist-bz2: dist-bzip2 ;
