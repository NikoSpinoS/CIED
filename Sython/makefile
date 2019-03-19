CC = gcc
CCFLAGS = -I.
LEX = lex

start: all

st.l.o:
		$(LEX) Sython.l

all: st.l.o
	$(CC) -o scanner lex.yy.c $(CCFLAGS)
