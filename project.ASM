org 0x100
global start
section .text

%macro write_string 1
    mov dx, %1
    mov ah, 9h
    int 21h
%endmacro

start:
    write_string pertama
    mov ah, 1       ;Membaca inputan dari user
    int 21h         ;Menjalankan interrupt
    write_string newline

    write_string kedua
    mov ah, 1       ;Membaca inputan dari user
    mov bl, al      ;Menginputan angka pertama lalu dimasukkan ke bl
    int 21h         ;Menjalankan interrupt
    write_string newline

    write_string ketiga
    mov ah, 1       ;Membaca inputan dari user
    mov bh, al      ;Menginputan angka kedua lalu dimasukkan ke bl
    int 21h         ;Menjalankan interrupt
    mov cl, al      ;Menginputan angka ketiga lalu dimasukkan ke bl
    write_string newline

    cmp bl, bh      ;Membandingkan antara angka kesatu dan angka kedua
    jge showbl      ;Jika angka kesatu lebih besar maka akan lompat ke if3
                    ;Jika angka kedua lebih besar maka lompatan akan diabaikan, lanjut ke if1

if1:
    cmp bh, cl      ;Membandingkan antara angka kedua dan angka ketiga
    jge showbh      ;Jika angka kedua lebih besar maka akan lompat ke showbh
                    ;Jika angka ketiga lebih besar maka akan mengabaikan lompatan, dan melanjutkan intruksi selanjutnya
    write_string Hasil
    mov ah, 2       ;Memberikan intruksi untuk menampilkan karakter
    mov dl, cl      ;Menampilkan karakter inputan angka ketiga
    int 21h         ;Menjalankan Interrupt
    jmp keluar      ;Lompat ke Keluar

showbh:
    write_string Hasil
    mov ah, 2       ;Memberikan intruksi untuk menampilkan karakter;
    mov dl, bh      ;Menampilkan karakter inputan angka kedua
    int 21h         ;Menjalankan Interrupt
    jmp keluar      ;Lompat ke Keluar

if2:
    cmp bl, cl      ;Membandingkan antara angka kesatu dan angka ketiga
    jge showbl      ;Jika angka kesatu lebih besar maka akan lompat ke showbl
                    ;Jika angka ketiga lebih besar maka akan mengabaikan lompatan, dan melanjutkan intruksi selanjutnya
    write_string Hasil
    mov ah, 2       ;Memberikan intruksi untuk menampilkan karakter
    mov dl, cl      ;Menampilkan karakter inputan angka ketiga
    int 21h         ;Menjalankan Interrupt
    jmp keluar      ;Lompat ke Keluar

showbl:
    write_string Hasil
    mov ah, 2       ;memberikan intruksi untuk menampilkan karakter
    mov dl, bl      ;menampilkan karakter inputan angka kesatu
    int 21h         ;Menjalankan Interrupt

keluar:
    mov ah, 4ch     ;Interrupt untuk keluar program
    int 21h         ;Menjalankan Interrupt

section .data
pertama: db "Masukkan angka pertama: $",
kedua: db "Masukkan angka kedua: $",
ketiga: db "Masukkan angka ketiga: $",
Hasil: db "Angka tertinggi: $",
newline: db 0xD, 0xA, "$"

