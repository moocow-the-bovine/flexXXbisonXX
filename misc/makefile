all : compiler dman

.SUFFIXES : .cc .y .l $(SUFFIXES)

.cc.o :
	$(CC)   -I$(CENTERCCLIBDIR)/incl -c  $*.cc

.y.cc :
	bison++ -d  -o $*.cc -h $*.h  $*.y
.l.cc :
	flex++  -8  -h$*.h -o$*.cc $*.l
.y.h :
	bison++ -d  -o $*.cc -h $*.h  $*.y
.l.h :
	flex++ -8   -h$*.h -o$*.cc $*.l

MyCompiler.o : MyCompiler.cc MyParser.h MyScanner.h
MyParser.o : MyParser.cc MyParser.h
MyScanner.o : MyScanner.cc MyScanner.h MyParser.h
dmanParser.o : dmanParser.cc dmanParser.h
dmanScanner.o : dmanScanner.cc dmanScanner.h dmanParser.h
MyParser.cc : MyParser.y
MyScanner.cc : MyScanner.l
dmanParser.cc : dmanParser.y
dmanScanner.cc : dmanScanner.l
MyParser.h : MyParser.y
MyScanner.h : MyScanner.l
dmanParser.h : dmanParser.y
dmanScanner.h : dmanScanner.l

compiler : MyCompiler.o MyParser.o MyScanner.o
	$(CC)  -o $@ MyCompiler.o MyParser.o MyScanner.o

dman : dmanParser.o dmanScanner.o
	$(CC)  -o $@ dmanParser.o dmanScanner.o

clean:
	rm -f compiler dman *.o *~
	rm -f MyParser.cc MyParser.h MyScanner.cc MyScanner.h
	rm -f dmanParser.cc dmanParser.h dmanScanner.h dmanScanner.cc
