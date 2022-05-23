org 0x100
global mulai
section .data

mulai:
    mov ah, 1
    int 21h
    mov bl, al
    int 21h
    mov bh, al
    int 21h
    mov cl, al

    cmp bl, bh
    jge angka3

angka1:
    cmp bh, cl
    jge angka2
    mov ah, 2
    mov dl, cl
    int 21h
    jmp keluar

angka2:
    mov ah, 2
    mov dl, bh
    int 21h
    jmp keluar

angka3:
    cmp bl, cl
    jge result
    mov ah, 2
    mov dl, cl
    int 21h
    jmp keluar

result:
    mov ah, 2
    mov dl, bl
    int 21h

keluar:
    mov ah, 4ch
    int 21h