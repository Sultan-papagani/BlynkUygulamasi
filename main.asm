'****************************************************************
'*  Name    : UNTITLED.BAS                                      *
'*  Author  : [BERKAY EFE OZBEN]                                *
'*  Notice  : Copyright (c) 2022 [select VIEW...EDITOR OPTIONS] *
'*          : All Rights Reserved                               *
'*  Date    : 11.10.2022                                        *
'*  Version : 1.0                                               *
'*  Notes   :                                                   *
'*          :                                                   *
'****************************************************************

'POP Only supported on 18F devices'
'fonksiyon gibi kullanıcaktım ama pop komutuve stack boyutu belirlemek sadece'
'18F serisinde varmış'

'Stack Underflow veya Overflow sorununu çözmek için GOTO tarzı yazdım'
'en iyi çözüm değil ama idare eder'

Device 16F84A
Declare Xtal = 4

Dim OrjSayi As Byte = 0

TRISB = $0
PORTB = $0

yazdir:
    If OrjSayi = 0 Then PORTB = %00111111
    If OrjSayi = 1 Then PORTB = %00000110
    If OrjSayi = 2 Then PORTB = %01011011
    If OrjSayi = 3 Then PORTB = %01001111
    If OrjSayi = 4 Then PORTB = %01100110
    If OrjSayi = 5 Then PORTB = %01101101
    If OrjSayi = 6 Then PORTB = %01111101
    If OrjSayi = 7 Then PORTB = %00000111
    If OrjSayi = 8 Then PORTB = %01111111
    If OrjSayi = 9 Then PORTB = %01101111
    GoTo prog_con
    
    
prog:
    If OrjSayi = 10 Then OrjSayi = 0
    GoTo yazdir
prog_con:
    OrjSayi = OrjSayi + 1
    DelayMS 500

GoTo prog

    
