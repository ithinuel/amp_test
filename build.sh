#!/usr/bin/zsh

# you can invoke "./build.sh -flto" to enable link time optimisation

if [ $# -gt 0 ]; then
    LINKMCPU=$1
    shift
else
    LINKMCPU=cortex-m0
fi

arm-none-eabi-gcc $@ -Os -mcpu=cortex-m0 -c test_cm0.c -o cm0.o || exit
arm-none-eabi-gcc $@ -Os -mcpu=cortex-m3 -c main.c     -o m.o || exit
arm-none-eabi-gcc $@ -Os -mcpu=cortex-m3 -c test_cm3.c -o cm3.o || exit
arm-none-eabi-gcc $@ -Os -nostartfiles -mcpu=$LINKMCPU -o multicore.elf cm0.o cm3.o m.o || exit
arm-none-eabi-objdump -DSC multicore.elf | pygmentize | less
