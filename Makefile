CC = arm-none-eabi-gcc
OPT = -O0
IS  = -mthumb
MACH = cortex-m4
STD = gnu11

CFILES = main.c

CFLAGS = -c	-mcpu=$(MACH) $(IS) -std=$(STD) $(OPT)

main.o:main.c
	$(CC) $(CFLAGS) -c -o $@ $^
