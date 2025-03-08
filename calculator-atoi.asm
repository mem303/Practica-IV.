; Calculator (ATOI)
; Compile with: nasm -f elf32 calculator-atoi.asm
; Link with: ld -m elf_i386 calculator-atoi.o -o calculator-atoi
; Run with: ./calculator-atoi 20 1000 317 1337

%include 'functions.asm'

SECTION .text
global _start

_start:
    pop     ecx            
    cmp     ecx, 1         
    jl      quit           
    pop     edx            
    sub     ecx, 1         
    mov     edx, 0         

nextArg:
    cmp     ecx, 0         
    jz      noMoreArgs     
    pop     eax             
    call    atoi            
    add     edx, eax       
    dec     ecx             
    jmp     nextArg        

noMoreArgs:
    mov     eax, edx       
    call    iprintLF        
    call    quit            


iprintLF:
    push    eax
    push    ecx
    push    edx

    mov     ecx, esp   
    mov     edx, 1     
    mov     eax, 4    
    mov     ebx, 1     
    int     0x80       

    pop     edx
    pop     ecx
    pop     eax
    ret

; Finalizar programa
quit:
    mov     eax, 1          
    xor     ebx, ebx        
    int     0x80           
    ret

SECTION .data
newLine db 0x0A
