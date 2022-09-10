.data
    HelloWorld:
        .ascii "Hello!"

    ByteLocation:
        .byte 10

    Int32:
        .int 2

    Int16:
        .short 3

    Float:
        .float 10.23
    
    IntergerArray:
        .int 10, 20, 30, 40, 50
    
.bss
    .comm LargeBuffer, 10000

.text 
    .globl _start

    _start:
        nop 
        # Exit syscall to exit the program
        mov $1, %rax
        mov $0, %rbx
        int $0x80
    