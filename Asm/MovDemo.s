# Demo data to show how to use data types and MOVx intrucstion

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
        # 1. Move immediate value into register
        mov $10, %rax

        # 2. MOV immediate value into memory location
        movw $50, Int16

        # 3. MOV data between register
        mov %rax, %rbx

        # 4. MOV data from memory to register
        mov Int32, %rax

        # 5. MOV data from register to memory
        mov $3, %al
        mov %al, ByteLocation

        # 6. MOV data into an indexed memory location
        # Location is decided by BaseAdrress(Offset, Index, DataSize)
        # Offset and Index must be register, Datasize can be a numerical value
        mov $0, %rcx
        mov $2, %rdi
        movl $22, IntergerArray(%rcx, %rdi, 4)
        
        # Exit syscall to exit the program
        mov $1, %rax
        mov $0, %rbx
        int $0x80