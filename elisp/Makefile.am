## File: src/Makefile.am
## Package: 
## Description:
##   + source-level automake file
##
## Process this file with Automake to create Makefile.in.
##-----------------------------------------------------------------------

##-----------------------------------------------------------------------
## subdirectories & locations
##-----------------------------------------------------------------------
#SUBDIRS =

MY_EMACS = @MY_EMACS@

SUFFIXES = .el .elc .pod .txt


##-----------------------------------------------------------------------
## sources
##-----------------------------------------------------------------------
lisp_LISP = \
	make-regexp.el \
	flex-mode.el  flex++-mode.el \
	bison-mode.el bison++-mode.el


# ELCFILES = $(ELFILES:.elc=.el)
#BISONDEPS = -l cc-mode.el -l make-regexp.el
#FLEXDEPS  = -l cc-mode.el -l make-regexp.el
FLEX_LOADS    = -l make-regexp.el
BISON_LOADS   = $(FLEX_LOADS) -l flex-mode.el
FLEXPP_LOADS  = $(FLEX_LOADS)
BISONPP_LOADS = $(BISON_LOADS) -l flex++-mode.el


PODS = README.pod

##-----------------------------------------------------------------------
## Rules: other
##-----------------------------------------------------------------------
.pod.txt:
	pod2text $< $@

bison-mode.elc: bison-mode.el
	$(MY_EMACS) $(BISON_LOADS) $(EMACSFLAGS) $<

bison++-mode.elc: bison++-mode.el
	$(MY_EMACS) $(BISONPP_LOADS) $(EMACSFLAGS) $<

flex-mode.elc: flex-mode.el
	$(MY_EMACS) $(FLEX_LOADS) $(EMACSFLAGS) $<

flex++-mode.elc: flex++-mode.el
	$(MY_EMACS) $(FLEXPP_LOADS) $(EMACSFLAGS) $<

.el.elc:
	$(MY_EMACS) $(EMACSFLAGS) $<


##-----------------------------------------------------------------------
## compile flags
##-----------------------------------------------------------------------
EMACSFLAGS = -vanilla -batch -f batch-byte-compile

##-----------------------------------------------------------------------
## Variables: cleanup
##-----------------------------------------------------------------------
CLEANFILES = $(ELCFILES) *~

DISTCLEANFILES = 

MAINTAINERCLEANFILES = Makefile.in $(PODS:.pod=.txt)

##-----------------------------------------------------------------------
## Variables: distribution
##-----------------------------------------------------------------------
EXTRA_DIST = $(PODS) $(PODS:.pod=.txt) $(lisp_LISP) bison-mode.el.txt

#DIST_SUBDIRS =


##-----------------------------------------------------------------------
## Rules: cleanup
##-----------------------------------------------------------------------
.PHONY: cvsclean
cvsclean: maintainer-clean ;

