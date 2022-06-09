ENTRY(_start)

SECTIONS {
  . = 0x7c00;

  .bootloader : {
    *(.boot-first-stage)
  }

  .kernel : {
    KEEP(*(.kernel))
  }
}
