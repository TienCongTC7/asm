.data
    HelloWorld:
        .asciz "Tien Cong!\n"

.text
    .globl _start
    .type PrintFunction, @function

    PrintFunction:
        push %rbp # store the current value of RBP on the stack
        mov %rsp, %rbp # Make the %RBP point to top of stack

        # The write function
        mov $4, %rax
        mov $1, %rbx
        mov 16(%rbp), %rcx
        mov 24(%rbp), %rdx
        int $0x80

        mov %rbp, %rsp # Restore the old value of rsp
        pop %rbp # Restore the old value of rbp
        ret # change rip to start the next instruction
    
    _start:
        nop
        # PUSH the strlen on the stack
        push $12
        # PUSH the string pointer on the stack
        push $HelloWorld
        # Call the function
        call PrintFunction
        # adjust the stack pointer
        add $16, %rsp
        jmp ExitCall

        # Exit Routine
        ExitCall:
            mov $1, %rax
            mov $0, %rbx
            int $0x80