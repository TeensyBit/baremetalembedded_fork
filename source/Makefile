CC = arm-none-eabi-gcc
OPT = -O0
IS  = -mthumb
WARN = -Wall
MACH = cortex-m4
STD = gnu11

CFILES=main.c led.c syscalls.c stm32_startup.c
OBJECTS=main.o led.o stm32_startup.o
BINARY = bin

CFLAGS = -c -mcpu=$(MACH) $(IS) -std=$(STD) $(OPT) $(DEPFLAGS) $(WARN)
LFLAGS = -nostdlib -T stm32_ls.ld -Wl,-Map=final.map

all: main.o led.o stm32_startup.o syscalls.o final.elf

main.o:main.c
	$(CC) $(CFLAGS) -c $^ -o $@

led.o:led.c
	$(CC) $(CFLAGS) -c $^ -o $@
	
stm32_startup.o:stm32_startup.c
	$(CC) $(CFLAGS) -c $^ -o $@

final.elf:$(OBJECTS)
	$(CC) $(LFLAGS) -o $@ $^

clean: 
	rm -rf  *.o *.elf

load:
	openocd -f interface/stlink-v2.cfg -f target/stm32f4x.cfg

gdbcli: 
	arm-none-eabi-gdb.exe
