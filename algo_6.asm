; Сортировка массива, бинарный поиск:
.486
.model flat, stdcall
option casemap :none
include includes\masm32.inc
include includes\kernel32.inc
include includes\macros\macros.asm
includelib includes\masm32.lib
includelib includes\kernel32.lib

.data
	array dword -1, 0, 2, 10, 25, -5, 125, -40 
	N dword 8 				
	M dword ?				
	search_number dword 25
	start_ dword ?
	end_ dword ?
	flag_ dword 0			
	
.code	
binary_search proc
	push ebp
    mov ebp, esp
    push esi
    push ecx
    push ebx
  
    mov esi, [ebp+8]        
    mov ecx, [ebp+12]       
    mov edx, [ebp+16]  		
    
    mov flag_, 0			
    mov start_, 0			
    dec edx	
	mov end_, edx			
    
    loop_search:
    	mov ebx, start_
    	cmp ebx, end_
    	jg end_binary_search
    	mov eax, start_
    	add eax, end_
		shr eax, 1     
		cmp [esi + eax*4], ecx
		jl first         
		jg second 
    	je result
    	jmp loop_search
    	
	first:
		inc eax
		mov start_, eax
		jmp loop_search
	
	second:
		dec eax
		mov end_, eax
		jmp loop_search
		
	result:
		mov flag_, 1
		
		;---------------------
		pushad
		print "Index: ",
		popad
		pushad
		print str$(eax),13,10
		popad 
		;---------------------
		
		jmp end_binary_
		
	end_binary_search:
		cmp flag_, 0
		je not_index
		jmp end_binary_
		
	not_index:
		
		;----------------------------
		pushad
		print "Index not found",13,10
		popad
		;----------------------------
		
		jmp end_binary_
		
	end_binary_:
		pop ebx
		pop ecx
		pop esi
		pop ebp
		ret 12  
		
binary_search endp	
	
start:
	mov eax, N
	dec eax
	mov [M], eax
	inc eax
	lea esi, array
	mov ecx, 0 	
						
	start_loop:
		cmp ecx, N
		jz end_loop
		mov ebx, 0 	
		start_next_loop:
			cmp ebx, M
			jge next
			mov eax, [esi + 4*ebx] 
			inc ebx
			mov edx, [esi + 4*ebx] 
			dec ebx
			cmp eax, edx
			jg swap
			inc ebx
			jmp start_next_loop
			
	swap:
		push eax
		push edx
		pop eax
		mov [esi + ebx *4], eax
		pop edx
		inc ebx
		mov [esi + ebx *4], edx
		dec ebx
		jmp start_next_loop
		
	next:
		inc ecx
		jmp start_loop
		
end_loop:
	
	;---------------------------
	pushad
	print "Array sorted: ",13,10
	popad
	;---------------------------
	
	lea esi, array
	mov ecx, 0
	st_loop:
		cmp ecx, N
		jz binary_search_start
		mov eax, [esi]
		
		;---------------------
		pushad
		print "array["
		popad
		pushad
		print str$(ecx)
		popad
		pushad
		print "]: "
		popad
		pushad
		print str$(eax),13,10
		popad
		;---------------------
		
		add esi, 4
		inc ecx
		jmp st_loop	
		
binary_search_start:
	push N
	push search_number
	push offset array
	call binary_search
	jmp end_prog
	
end_prog:
	exit
end start