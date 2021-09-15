# This script has been deprecated in favor of a traditional Makefile structure.

OS_HOME=/home/jacob/os_dev
BUILD_DIR=$OS_HOME/build
SRC_DIR=$OS_HOME/src

mkdir -p $BUILD_DIR
rm -r $BUILD_DIR/*

nasm -f bin $SRC_DIR/bootloader.asm -o $BUILD_DIR/bootloader
nasm -f bin $SRC_DIR/sample.asm -o $BUILD_DIR/sample

# Create our disk image
dd if=/dev/zero of=$BUILD_DIR/disk.img bs=512 count=2880

# Load our bootloader to the first sector of the floppy
dd conv=notrunc if=$BUILD_DIR/bootloader of=$BUILD_DIR/disk.img bs=512 count=1 seek=0

# Load our "OS" to the second sector of the floppy
dd if=$BUILD_DIR/sample of=$BUILD_DIR/disk.img bs=512 count=1 seek=1
