; Перевод из десятичной в двоичную систему счисления (0-255):
.386
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib
.code
start:
    mov eax, uval(input("Input: "))
    mov cl, 8
start_loop:
	shl al, 1
	jc print_one
	;--------
	pushad
	print "0"
	popad
	;--------
jmp continue_loop
print_one:
    ;--------
	pushad
	print "1"
	popad
	;--------
continue_loop:
    loop start_loop  
;--------------
print "b",13,10
;--------------
end start