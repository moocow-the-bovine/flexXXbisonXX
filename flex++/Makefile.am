## File: src/Makefile.am
## Package: 
## Description:
##   + source-level automake file
##
## Process this file with Automake to create Makefile.in.
##-----------------------------------------------------------------------
#
# adapted from:
# make file for "flex" tool

# @(#) $Header$ (LBL)

# Porting considerations:
#
#    For System V Unix machines, add -DUSG to CFLAGS (if it's not
#         automatically defined)
#    For Vax/VMS, add "-DVMS -DUSG" to CFLAGS.
#    For MS-DOS, add "-DMS_DOS -DUSG" to CFLAGS.  Create \tmp if not present.
#	  See MSDOS.notes for more info.
#    For Amiga, add "-DAMIGA -DUSG" to CFLAGS.
#    For SCO Unix, add "-DSCO_UNIX" to CFLAGS.
#
#    For C compilers which don't know about "void", add -Dvoid=int to CFLAGS.
#
#    If your C compiler is ANSI standard but does not include the <stdlib.h>
#    header file (some installations of gcc have this problem), then add
#    -DDONT_HAVE_STDLIB_H to CFLAGS.
#
# By default, flex will be configured to generate 8-bit scanners only
# if the -8 flag is given.  If you want it to always generate 8-bit
# scanners, add "-DDEFAULT_CSIZE=256" to CFLAGS.  Note that doing
# so will double the size of all uncompressed scanners.
# 
# If on your system you have trouble building flex due to 8-bit
# character problems, remove the -8 from FLEX_FLAGS and the
# "#define FLEX_8_BIT_CHARS" from the beginning of flexdef.h.

# the first time around use "make first_flex"

# Installation targeting.  Files will be installed under the tree rooted
# at DESTDIR.  User commands will be installed in BINDIR, library files
# in LIBDIR (which will be created if necessary), auxiliary files in
# AUXDIR, manual pages will be installed in MANDIR with extension MANEXT.
# Raw, unformatted troff source will be installed if INSTALLMAN=man, nroff
# preformatted versions will be installed if INSTALLMAN=cat.

##-----------------------------------------------------------------------
## subdirectories
##-----------------------------------------------------------------------
#SUBDIRS =

##-----------------------------------------------------------------------
## primary targets
##-----------------------------------------------------------------------
bin_PROGRAMS = flex++

#lib_LTLIBRARIES = libflexlib.la
lib_LIBRARIES = libflexlib.a

pkgdata_DATA = flexskel.cc flexskel.h
man_MANS = flex.1 flexdoc.1 flex++.1

include_HEADERS = @HACKED_HEADERS@
EXTRA_HEADERS   = osfcn.h

##-----------------------------------------------------------------------
## sources
##-----------------------------------------------------------------------
flex___SOURCES = \
	ccl.c \
	dfa.c \
	ecs.c \
	gen.c \
	main.c \
	misc.c \
	nfa.c \
	scan.l \
	parse.y \
	sym.c \
	tblcmp.c \
	yylex.c

#EXTRA_flex___SOURCES = initscan.c scan.c parse.c parse.h
EXTRA_flex___SOURCES = initscan.c

#libflexlib_la_SOURCES = libmain.c
libflexlib_a_SOURCES = libmain.c

##-----------------------------------------------------------------------
## data
##-----------------------------------------------------------------------
SKELETON_FILE = $(pkgdatadir)/flexskel.cc
HEADERSKELETON_FILE = $(pkgdatadir)/flexskel.h

##-----------------------------------------------------------------------
## headers
##-----------------------------------------------------------------------
#pkginclude_HEADERS = ${hfile_1} ... ${hfile_N}

noinst_HEADERS = flexdef.h  flexskel.h

##-----------------------------------------------------------------------
## hacked headers
##-----------------------------------------------------------------------
osfcn.h: myosfcn.h
	cp $< $@

##-----------------------------------------------------------------------
## compile flags
##-----------------------------------------------------------------------
SRCDIR = @srcdir@
srcdir = @srcdir@
SRCINCLUDE = $(SRCDIR)/../include

## --- these are equivalent
AM_CPPFLAGS = -I$(SRCINCLUDE) \
	-DDEFAULT_SKELETON_FILE=\"$(SKELETON_FILE)\" \
	-DDEFAULT_SKELETONHEADER_FILE=\"$(HEADERSKELETON_FILE)\"


##-----------------------------------------------------------------------
## additional programs & flags
##-----------------------------------------------------------------------
FLEXXX_MAKE_SCAN_C = @flexxx_make_scan_c@
FLEX_FLAGS = -ist8
COMPRESSION  = 

LIBCUR = 0
LIBAGE = 0
LIBREV = 1

##-----------------------------------------------------------------------
## link flags
##   + library special handling of configure.in vars:
##-----------------------------------------------------------------------
flex___LDFLAGS = -s
#flex___LDADD   = 

#libflexlib_a_LDFLAGS =

#libflexlib_la_LDFLAGS = -version-info $(LIBCUR):$(LIBREV):$(LIBAGE)
##libflexlib_la_LIBADD  =

##-----------------------------------------------------------------------
## Variables: cleanup
##-----------------------------------------------------------------------
CLEANFILES = flexlib.a *~

DISTCLEANFILES = @flexxx_distclean_files@

MAINTAINERCLEANFILES = Makefile.in scan.c parse.c parse.h

##-----------------------------------------------------------------------
## Variables: distribution
##-----------------------------------------------------------------------
EXTRA_DIST = $(man_MANS) $(pkgdata_DATA) \
	     notesevolution \
	     Changes \
	     COPYING \
	     README  \
	     flex_pp.mak \
	     Notes.txt \
	     flex++.1.dman \
	     myosfcn.h

MISC_FILES = \
	Atari.patches \
	MSDOS.notes \
	Makefile.VMS \
	README \
	Turbo-C.notes

#	flex.skel.old

#DIST_SUBDIRS =

dist-hook: 
	mkdir -p $(distdir)/MISC
	for f in $(MISC_FILES) ; do \
	  cp -p $(srcdir)/MISC/$$f $(distdir)/MISC ;\
	done

##-----------------------------------------------------------------------
## Rules: cleanup
##-----------------------------------------------------------------------
.PHONY: cvsclean lyclean

cvsclean: maintainer-clean ;

lyclean:
	rm -f parse.c parse.h scan.c

##-----------------------------------------------------------------------
## Rules: parser generation
##-----------------------------------------------------------------------
scan.c: scan.l
	@flexxx_make_scan_c@

parse.h parse.c: parse.y
	$(YACC) -d $(srcdir)/parse.y
	sed '/extern char.*malloc/d' <y.tab.c >parse.c
	rm -f y.tab.c
	mv y.tab.h parse.h

scan.o: parse.h
