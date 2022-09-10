.data
    HelloWorldString:
        .asciz "Hello World of Assembly!"
    H3llO:
        .asciz "H3llO"

.bss
    .lcomm Destination, 100
    .lcomm DestinationUsingRep, 100
    .lcomm DestinationUsingStos, 100

.text
    .globl _start

    _start:
        nop 
        # 1. Simple copy using movsb, movsw, movsl
        mov $HelloWorldString, %rsi
        mov $Destination, %rdi

        movsb
        movsw
        movsl

        # 2. Setting / Clearing the DF flag
        std # set the DF flag
        cld # clear the DF flag

        # 3. Using REP
        mov $HelloWorldString, %rsi
        mov $DestinationUsingRep, %rdi
        mov $25, %rcx # Set the string length in rcx
        cld # Clear the DF
        rep movsb
        std

        # 4. Loading string from memory into rax register
        cld 
        lea HelloWorldString, %rsi
        lodsb # Copy the first byte of HelloWorldString to al
        movb $0, %al

        dec %rsi
        lodsw
        movw $0,%ax
        
        sub $2, %rsi # Make RSI point back to the original string
        lodsl

        # 5. Storing strings from RAX to memory
        lea DestinationUsingStos, %rdi
        stosb
        stosw
        stosl

        # 6. Comparing Strings
        cld
        lea HelloWorldString, %rsi
        lea H3llO, %rdi
        cmpsb

        dec %rsi
        dec %rdi
        cmpsw

        sub $2, %rsi
        sub $2, %rdi
        cmpsl

        # The exit() routine
        mov $1, %rax
