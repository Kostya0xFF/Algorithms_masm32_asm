; Возведение числа x в степень p (x^p): 
.386
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib
.data
	x dword 2
	p dword 5
.code
start:
	mov ebx, x
	mov eax, 1
	mov ecx, p
	start_loop:
		cmp ecx, 0
		jz end_loop
		imul eax, ebx
		dec ecx
		jmp start_loop
		
end_loop:
	
	;--------------------
	pushad
	print "Result: "
	popad
	pushad
	print str$(eax),13,10
	popad
	;--------------------
	
	exit
end start