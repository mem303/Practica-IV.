SECTION .text
global sprintLF, sprint, iprintLF, quit

extern printf

sprintLF:
    push ebp
    mov ebp, esp
    push dword [ebp+8]
    call printf
    add esp, 4
    mov eax, 10
    push eax
    call printf
    add esp, 4
    pop ebp
    ret

sprint:
    push ebp
    mov ebp, esp
    push dword [ebp+8]
    call printf
    add esp, 4
    pop ebp
    ret

iprintLF:
    push ebp
    mov ebp, esp
    push dword [ebp+8]
    push format
    call printf
    add esp, 8
    pop ebp
    ret

quit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
