OS_HOME=/home/jacob/os_dev
BUILD_DIR=$OS_HOME/build
SRC_DIR=$OS_HOME/src

mkdir -p $BUILD_DIR
rm -r $BUILD_DIR/*

nasm -f bin $SRC_DIR/boot_sector.asm -o $BUILD_DIR/bootloader
dd if=/dev/zero of=$BUILD_DIR/disk.img bs=512 count=2880
dd conv=notrunc if=$BUILD_DIR/bootloader of=$BUILD_DIR/disk.img bs=512 count=1 seek=0
