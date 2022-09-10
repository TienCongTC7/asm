.data
    HelloWorld:
        .asciz "Hello World!\n"
    HelloFunction:
        .asciz "HelloFunction!\n"
    
.text
    .globl _start
    .type MyFunction, @function 
    MyFunction: # String pointer and len to be added by caller
                    movl $4, %eax 
                    movl $1, %ebx    
                    ret
    
    _start:
        nop
        # Print Hello World string
        call MyFunction
        leal HelloWorld, %ecx 
        movl $14, %edx
        int $0x80

        # Print Hello World Function
        call MyFunction
        leal HelloFunction, %ecx
        movl $16, %edx
        int $0x80
        # Exit Routine

    ExitCall:
        movl $1, %eax
        movl $0, %ebx
        int $0x80 