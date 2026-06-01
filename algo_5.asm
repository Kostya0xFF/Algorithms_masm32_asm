; Вычисление факториала числа (n!):
.386
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib
.data
	N dword 5
.code
start:
	mov eax, 1
	mov ecx, N
	start_loop:
		cmp ecx, 0
		jz end_loop
		imul eax, ecx
		dec ecx
		jmp start_loop
end_loop:
	;--------------------
	pushad
	print str$(eax),13,10
	popad
	;--------------------
	exit
end start