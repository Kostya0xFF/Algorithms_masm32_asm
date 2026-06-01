; Поиск минимального элемента в массиве:
.386
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib
.data 
	array dword -1, 0, 10, 20, 100, 50, 95, 130, -80, 15
	N dword 10 
.code
start:
	lea esi, array
	mov eax, [esi + 0] 
	mov ecx, N 
	start_loop:
		cmp ecx, 0		
		jz end_loop
		dec ecx
		mov ebx, [esi]
		add esi, 4
		cmp ebx, eax
		jl swap
		jmp start_loop
swap:
	mov eax, ebx	
	jmp start_loop
	
end_loop:
	;-------------------------
	push eax 
	print "Minimum element: "
	pop ebx
	print str$(ebx),13,10
	;-------------------------
	exit
end start