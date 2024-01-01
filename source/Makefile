CC = arm-none-eabi-gcc
OPT = -O0
IS  = -mthumb
WARN = -Wall
MACH = cortex-m4
STD = gnu11
FPU = soft

CFILES=main.c led.c syscalls.c stm32_startup.c
OBJECTS=stm32_startup.o main.o led.o syscalls.o
OBJECTS_SEMI=stm32_startup.o main.o led.o 
BINARY = bin

CFLAGS = -c -mcpu=$(MACH) $(IS) -mfloat-abi=$(FPU) -std=$(STD) $(OPT) $(DEPFLAGS) $(WARN)
LFLAGS = -mcpu=$(MACH) $(IS) -mfloat-abi=$(FPU) --specs=nano.specs -T stm32_ls.ld -Wl,-Map=final.map
LFLAGS_SH = -mcpu=$(MACH) $(IS) -mfloat-abi=$(FPU) --specs=rdimon.specs -T stm32_ls.ld -Wl,-Map=final.map

all: main.o led.o stm32_startup.o syscalls.o final.elf
semi: main.o led.o stm32_startup.o final_sh.elf	#semihosting library provides the syscalls

main.o:main.c
	$(CC) $(CFLAGS) -c $^ -o $@

led.o:led.c
	$(CC) $(CFLAGS) -c $^ -o $@
	
stm32_startup.o:stm32_startup.c
	$(CC) $(CFLAGS) -c $^ -o $@

syscalls.o: syscalls.c
	$(CC) $(CFLAGS) -c $^ -o $@

final.elf:$(OBJECTS)
	$(CC) $(LFLAGS) -o $@ $^

final_sh.elf:$(OBJECTS_SEMI)
	$(CC) $(LFLAGS_SH) -o $@ $^

clean: 
	rm -rf  *.o *.elf

load:
	openocd -f interface/stlink-v2.cfg -f target/stm32f4x.cfg

gdbcli: 
	arm-none-eabi-gdb.exe
