.data
    HelloWorld:
        .asciz "Hello World!\n"
    ZeroFlagSet:
        .asciz "Zero Flag was Set!"
    ZeroFlagNotSet:
        .asciz "Zero Flag Not Set!"
    
.text
    .globl _start
    _start:
        nop
        mov $10, %rax
        xor %rax, %rax
        jz PrintHelloWorld
    
    FlagNotSetPrint:
        mov $4, %rax
        mov $1, %rbx
        lea ZeroFlagNotSet, %rcx
        mov $19, %rdx
        int $0x80
        jmp ExitCall
    
    FlagSetPrint:
        mov $4, %rax
        mov $1, %rbx
        lea ZeroFlagSet, %rcx
        mov $19, %rdx
        int $0x80
        jmp ExitCall

    ExitCall:
        mov $1, %rax
        mov $0, %rbx
        int $0x80
    
    PrintHelloWorld:
        mov $10, %rcx
        PrintTenTime:
            push %rcx
            mov $4, %rax
            mov $1, %rbx
            lea HelloWorld, %rcx 
            mov $14, %rdx
            int $0x80
            pop %rcx
        loop PrintTenTime
        jmp ExitCall
    

            
