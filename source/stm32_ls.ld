/* 
Linker Script Workflow:

References: 
.text = includes the code
.data = initialized data
.bss = un-initialized data

1. Describe Memory Layout
    Flash and SRAM
2. Sections describes the sections in the output file: 
    .text: -> VMA: Flash LMA:SRAM
        Combine .text, .isr_vector, and ,rodata 
    .data: VMA: SRAM LMA: FLASH
        .data section of input obj files
    .bss: VMA: SRAM LMA: SRAM
        .bss section of of input obj files
3. Reset_Handler in startup file copies .data section from FLASH to SRAM
4. Setup symbols to keep track of location counter
*/


ENTRY(Reset_Handler)

MEMORY
{
    FLASH(rx) : ORIGIN = 0x08000000, LENGTH = 1024K  //0x08000000 - 0x080FFFFF
    SRAM(rwx) : ORIGIN = 0x08000000, LENGTH = 128K  //0x20000000 - 0x2001FFFF
}

SECTIONS
{
    .text
    {
        *(.isr_vector)
        *(.text)
        *(.rodata)
        _etext = .;
    }> FLASH

    .data
    {
        _sdata = .;     //Location counter's address resets to the start of the VMA - SRAM
        *(.data)
        _edata = .;
    }> SRAM AT> FLASH       

    .bss
    {
        _sbss = .;
        *(.bss)
        _ebss = .;
    }> SRAM
}
