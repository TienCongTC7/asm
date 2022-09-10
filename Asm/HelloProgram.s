.data

HelloWorldString:
	.ascii "Hello Nguyen Tien Cong\n"
.text

.globl _start

_start:
	# Load all the argument for write()
	movl $0x04, %eax
	movl $1, %ebx
	movl $HelloWorldString, %ecx
	movl $24, %edx
	int $0x80
	
	# Exit the program
	movl $1, %eax
	movl $0, %ebx
	int $0x80

