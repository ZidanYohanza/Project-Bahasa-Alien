org 0x100
global start
section .text

start:
    mov ah, 1       ;Membaca inputan dari user
    int 21h         ;Menjalankan interrupt
    mov bl, al      ;Menginputan angka pertama lalu dimasukkan ke bl
    int 21h         ;Menjalankan interrupt
    mov bh, al      ;Menginputan angka kedua lalu dimasukkan ke bl
    int 21h         ;Menjalankan interrupt
    mov cl, al      ;Menginputan angka ketiga lalu dimasukkan ke bl

    cmp bl, bh      ;Membandingkan antara angka kesatu dan angka kedua
    jge if3         ;Jika angka kesatu lebih besar maka akan lompat ke if3
                    ;Jika angka kedua lebih besar maka lompatan akan diabaikan, lanjut ke if1

if1:
    cmp bh, cl      ;Membandingkan antara angka kedua dan angka ketiga
    jge showbh      ;Jika angka kedua lebih besar maka akan lompat ke showbh
                    ;Jika angka ketiga lebih besar maka akan mengabaikan lompatan, dan melanjutkan intruksi selanjutnya
    mov ah, 2       ;Memberikan intruksi untuk menampilkan karakter
    mov dl, cl      ;Menampilkan karakter inputan angka ketiga
    int 21h         ;Menjalankan Interrupt
    jmp keluar      ;Lompat ke Keluar

showbh:
    mov ah, 2       ;Memberikan intruksi untuk menampilkan karakter;
    mov dl, bh      ;Menampilkan karakter inputan angka kedua
    int 21h         ;Menjalankan Interrupt
    jmp keluar      ;Lompat ke Keluar

if2:
    cmp bl, cl      ;Membandingkan antara angka kesatu dan angka ketiga
    jge showbl      ;Jika angka kesatu lebih besar maka akan lompat ke showbl
                    ;Jika angka ketiga lebih besar maka akan mengabaikan lompatan, dan melanjutkan intruksi selanjutnya
    mov ah, 2       ;Memberikan intruksi untuk menampilkan karakter
    mov dl, cl      ;Menampilkan karakter inputan angka ketiga
    int 21h         ;Menjalankan Interrupt
    jmp keluar      ;Lompat ke Keluar

showbl:
    mov ah, 2       ;memberikan intruksi untuk menampilkan karakter
    mov dl, bl      ;menampilkan karakter inputan angka kesatu
    int 21h         ;Menjalankan Interrupt

keluar:
    mov ah, 4ch     ;Interrupt untuk keluar program
    int 21h         ;Menjalankan Interrupt