boot:
	nasm "boot.asm" -f bin -o "build/boot/boot.bin"
kernel:
	nasm "kernel_entry.asm" -f elf -o "build/kernel/kernel_entry.o"
	i686-elf-gcc -ffreestanding -m32 -g -c "kernel.c" -o "build/kernel/kernel.o"
zeroes:
	nasm "zeroes.asm" -f bin -o "build/zeroes.bin"
bind-kernel:
	i686-elf-ld -o "build/kernel/full_kernel.bin" -Ttext 0x1000 "build/kernel/kernel_entry.o" "build/kernel/kernel.o" --oformat binary
os:
	cat "build/boot/boot.bin" "build/kernel/full_kernel.bin" "build/zeroes.bin" > "os/LowS.bin"
run:
	qemu-system-x86_64 -drive format=raw,file="os/LowS.bin",index=0,if=floppy,  -m 128M
everything:
	nasm "boot.asm" -f bin -o "build/boot/boot.bin"
	nasm "kernel_entry.asm" -f elf -o "build/kernel/kernel_entry.o"
	i686-elf-gcc -ffreestanding -m32 -g -c "kernel.c" -o "build/kernel/kernel.o"
	nasm "zeroes.asm" -f bin -o "build/zeroes.bin"
	i686-elf-ld -o "build/kernel/full_kernel.bin" -Ttext 0x1000 "build/kernel/kernel_entry.o" "build/kernel/kernel.o" --oformat binary
	cat "build/boot/boot.bin" "build/kernel/full_kernel.bin" "build/zeroes.bin" > "os/LowS.bin"
C:
	nasm "kernel_entry.asm" -f elf -o "build/kernel/kernel_entry.o"
	i686-elf-gcc -ffreestanding -m32 -g -c "kernel.c" -o "build/kernel/kernel.o"
	i686-elf-ld -o "build/kernel/full_kernel.bin" -Ttext 0x1000 "build/kernel/kernel_entry.o" "build/kernel/kernel.o" --oformat binary
	cat "build/boot/boot.bin" "build/kernel/full_kernel.bin" "build/zeroes.bin" > "os/LowS.bin"