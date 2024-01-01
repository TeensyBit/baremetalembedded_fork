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
    FLASH(rx):ORIGIN =0x08000000,LENGTH =1024K 
    SRAM(rwx):ORIGIN =0x20000000,LENGTH =128K
}

SECTIONS
{
    .text :
    {
        *(.isr_vectors)
        *(.text)
        *(.rodata)
        . = ALIGN(4);
        _etext = .;
    }> FLASH

    .data :
    {
        _sdata = .;   
        *(.data)
        . = ALIGN(4);
        _edata = .;
    }> SRAM AT> FLASH       

    .bss :
    {
        _sbss = .;
        __bss_start__ = _sbss;
        *(.bss)
        . = ALIGN(4);
        _ebss = .;
        __bss_end__ = _ebss;
        . = ALIGN(4);
        end = .;
    }> SRAM
}
