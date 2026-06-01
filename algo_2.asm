; Поиск максимального элемента в массиве:
.386
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib
.data
	array dword -10, 20, 5, 0, 10, 240, 2, -220, 60, 55
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
		jg swap
		jmp start_loop
swap:
	mov eax, ebx	
	jmp start_loop
end_loop:
	;-------------------------
	push eax 
	print "Maximum element: "
	pop ebx
	print str$(ebx),13,10
	;-------------------------
	exit
end start