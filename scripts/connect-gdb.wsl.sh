#!/bin/bash

set -e

 ~/bin/zephyr-sdk-0.16.8/riscv64-zephyr-elf/bin/riscv64-zephyr-elf-gdb -x /mnt/c/programming/beaglev/scripts/init.gdb ~/zephyrproject/build/zephyr/zephyr.elf