ENTRY(Reset_Handler)

MEMORY
{
    FLASH(rx): ORIGIN = 0x08000000 ,LENGTH = 1024K
    RAM(rwx): ORIGIN = 0X20000000, LENGTH = 128K
}

/*
main.o - .text, .data, .bss, .rodata
led.o - .text, .data, .bss, .rodata

final.elf: Done by the linker and locator with the help of the linker script
.text -> .text(main.o) + .text(led.o)
.data -> .data(main.o) + .data(led.o)
.bss  -> .bss(main.o) + .bss(led.o)
.rodata -> .rodata(main.o) + .rodata(led.o)
*/

 
.text:                              //merge all .isr_vector, .text and .rodata 
{

}