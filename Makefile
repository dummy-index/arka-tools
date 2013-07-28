CC=gcc
CFLAGS=-Wall -fno-builtin -g -O2

all : arka-lalr

arka-lalr : arka-lalr.tab.o arka-lalr.lex.yy.o
	$(CC) arka-lalr.tab.o arka-lalr.lex.yy.o -o arka-lalr -lfl #-ly

arka-lalr.tab.o : arka-lalr.tab.c

arka-lalr.lex.yy.o : arka-lalr.lex.yy.c

arka-lalr.tab.c : arka-lalr.y
	bison -dvt $<

arka-lalr.lex.yy.c : arka-lalr.l
	flex -i -o$@ $<

clean :
	rm -f arka-lalr.lex.yy.[co] arka-lalr.tab.[cho] arka-lalr

.c.o:
	$(CC) $(CFLAGS) -c -o $@ $<

