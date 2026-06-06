; Вычисление количества символов в строке:
.386
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib
.data
	EOL EQU 00h
	array DB 100 dup(EOL)
.code
start:
	mov esi, input("String: ") 
	lea edi, array
	cld
	mov ecx, 0
load: 
	inc ecx 
	lodsb 
	stosb
	cmp al, EOL
	jnz load
	dec ecx
	;--------------------
	pushad
	print str$(ecx),13,10 
	popad
	;--------------------
	exit
end start