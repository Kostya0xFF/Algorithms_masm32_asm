; Вычисление N-ого числа Фибоначчи:
.386
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib
.data
	N  dword 10
	a_1 dword 0
	a_2 dword 1
.code
start:
	mov ebx, a_1
	mov edx, a_2
	mov ecx, N
	start_loop:
		cmp ecx, 0
		jz end_loop
		mov eax, ebx
		mov ebx, edx
		add eax, edx
		mov edx, eax
		dec ecx
		jmp start_loop
end_loop:
	;--------------------
	pushad
	print "Result: F_n = "
	popad
	pushad
	print str$(ebx),13,10
	popad
	;--------------------
	exit
end start