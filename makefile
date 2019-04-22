##################################################################
#
# Mastermind/2
#
##################################################################

CC=gcc
AS=as
MKLIB=ar r
MAKE=make
CP=cp
RM=rm -f
RC=rc

CFLAGS=-Zomf -Zcrtdll -O

main: main.c main.def
	$(CC) main.c main.def $(CFLAGS)

