; Сумма двух целых чисел: 
.486
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib

.data
	x dword ?
   	y dword ?
.code

function proc
	push ebp 
	mov ebp, esp
	push ebx
	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	add eax, ebx
	pop ebx
	pop ebp
	ret 8
function endp

start:
	mov eax, sval(input("Input x:  "))
	mov [x], eax
	mov eax, sval(input("Input y:  "))
	mov [y], eax
	push [x]
	push [y]
	call function
	
	;--------------------
	pushad
	print str$(eax),13,10
	popad
	;--------------------
	
	exit
end start