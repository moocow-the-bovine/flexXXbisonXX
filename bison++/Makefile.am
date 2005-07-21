## File: bison++/Makefile.am
## Package: flex++bison++
## Description:
##   + source-level automake file
##
## Process this file with Automake to create Makefile.in.
##-----------------------------------------------------------------------

##-----------------------------------------------------------------------
## subdirectories & locations
##-----------------------------------------------------------------------
#SUBDIRS =

##-----------------------------------------------------------------------
## primary targets
##-----------------------------------------------------------------------
bin_PROGRAMS = bison++

pkgdata_DATA = $(PFILE) $(PFILE1) $(HFILE)
man_MANS = bison.1 bison++.1
info_TEXINFOS = bison.texinfo


##-----------------------------------------------------------------------
## sources
##-----------------------------------------------------------------------
bison___SOURCES = \
	  lr0.c allocate.c closure.c conflict.c derives.c files.c	\
	  getargs.c gram.c lalr.c lex.c					\
	  main.c nullable.c output.c print.c reader.c reduce.c symtab.c	\
	  warshall.c version.c						\
	  getopt.c getopt1.c

EXTRA_bison___SOURCES = alloca.c
bison___DEPENDENCIES = $(ALLOCA)
bison___LDADD = $(ALLOCA)

#${prog_i}_SOURCES =
#${lib_i}_la_SOURCES =

##-----------------------------------------------------------------------
## deps
##-----------------------------------------------------------------------
lr0.o: system.h machine.h new.h gram.h state.h
closure.o: system.h machine.h new.h gram.h
conflict.o: system.h machine.h new.h files.h gram.h state.h
derives.o: system.h new.h types.h gram.h
files.o: system.h files.h new.h gram.h
getargs.o: system.h files.h
lalr.o: system.h machine.h types.h state.h new.h gram.h
lex.o: system.h files.h symtab.h lex.h
main.o: system.h machine.h
nullable.o: system.h types.h gram.h new.h
output.o: system.h machine.h new.h files.h gram.h state.h
print.o: system.h machine.h new.h files.h gram.h state.h
reader.o: system.h files.h new.h symtab.h lex.h gram.h
reduce.o: system.h machine.h files.h new.h gram.h
symtab.o: system.h new.h symtab.h gram.h
warshall.o: system.h machine.h

##-----------------------------------------------------------------------
## headers
##-----------------------------------------------------------------------
#pkginclude_HEADERS = ${hfile_1} ... ${hfile_N}

noinst_HEADERS = \
	bison.h  getopt.h  lex.h      new.h    symtab.h  types.h \
	files.h  gram.h    machine.h  state.h  system.h

##-----------------------------------------------------------------------
## compile flags
##-----------------------------------------------------------------------
SRCDIR = @srcdir@
SRCINCLUDE = $(SRCDIR)/../include

## --- these are equivalent
AM_CPPFLAGS = -I$(SRCINCLUDE)

# names of parser files
PFILE = bison.cc
PFILE1 = bison.hairy
HFILE = bison.h

PFILES = -DXPFILE=\"$(pkgdatadir)/$(PFILE)\" \
	 -DXHFILE=\"$(pkgdatadir)/$(HFILE)\" \
	 -DXPFILE1=\"$(pkgdatadir)/$(PFILE1)\"

##-----------------------------------------------------------------------
## Additional Rules: compile
##-----------------------------------------------------------------------
# This file is different to pass the parser file names to the compiler.
files.o: files.c
	$(CC) -c $(PFILES) $(DEFS) $(CPPFLAGS) $(CFLAGS) \
	   $(srcdir)/files.c $(OUTPUT_OPTION)

# MAKEINFO = makeinfo
# bison.info: bison.texinfo
#	$(MAKEINFO) $(srcdir)/bison.texinfo

#TAGS: *.c *.h
#	etags *.c *.h


##-----------------------------------------------------------------------
## link flags
##   + library special handling of configure.in vars:
##-----------------------------------------------------------------------
#${prog_i}_LDFLAGS = -L. -static
#${prog_i}_LDADD   = ${non_src_file}.o -lsomelib
#${lib_i}_la_LDFLAGS = -L. -version-info ${lib_i_current}:${lib_i_rev}:${lib_i_age}
#${lib_i}_LIBADD     = -lotherlib

##-----------------------------------------------------------------------
## Variables: cleanup
##-----------------------------------------------------------------------
CLEANFILES = *~

DISTCLEANFILES = 

MAINTAINERCLEANFILES = Makefile.in

##-----------------------------------------------------------------------
## Variables: distribution
##-----------------------------------------------------------------------
EXTRA_DIST = $(PFILE) $(PFILE1) $(HFILE) \
		$(man_MANS) \
		bison.rnh \
		build.com configure.bat \
		vmsgetargs.c vmshlp.mar

#		bison.texinfo bison.info bison.info-*

#DIST_SUBDIRS =


##-----------------------------------------------------------------------
## Rules: cleanup
##-----------------------------------------------------------------------
.PHONY: cvsclean
cvsclean: maintainer-clean ;
