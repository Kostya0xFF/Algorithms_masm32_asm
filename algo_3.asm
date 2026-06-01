; Сумма всех элементов массива:
.386
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib
.data
	array dword 1, 2, 3, 4, 5, 6, 7, 8, 9, -10
	N dword 10
.code
start:
	lea esi, array
	mov eax, 0
	mov ecx, N
	start_loop:
		cmp ecx, 0
		jz end_loop
		mov ebx, [esi]
		add eax, ebx
		add esi, 4
		dec ecx
		jmp start_loop
end_loop:
	;--------------------
	pushad
	print "Amount: "
	popad
	pushad
	print str$(eax),13,10
	popad
	;--------------------
	exit
end start