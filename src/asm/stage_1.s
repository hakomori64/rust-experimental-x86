.section .boot-first-stage, "awx"
.global _start
.code16

_start:
  xor ax, ax
  mov ds, ax
  mov es, ax
  mov ss, ax
  mov fs, ax
  mov gs, ax

  cld

  mov sp, 0x7c00

  mov si, offset boot_start_str
  call real_mode_println

real_mode_println:
  call real_mode_print
  mov al, 13 # \r
  call real_mode_print_char
  mov al, 10 # \n
  jmp real_mode_print_char

# print a string
# IN
#   si: points at zero-terminated String
# CLOBBER
#   ax
real_mode_print:
  cld
real_mode_print_loop:
  lodsb al, BYTE PTR [si]
  test al, al
  jz real_mode_print_done
  call real_mode_print_char
  jmp real_mode_print_loop
real_mode_print_done:
  ret

# print a character
# IN
#   al: character to print
# CLOBBER
#   ah
real_mode_print_char:
  mov ah, 0x0e
  int 0x10
  ret

boot_start_str: .asciz "Booting (first stage)..."

.org 510
.word 0xaa55
