# $(info BOOTLOADER_OBJS is $(BOOTLOADER_OBJS))

OS_HOME:=/home/jacob/os_dev
BUILD_DIR:=$(OS_HOME)/build
# SRC_DIR:=$(OS_HOME)/src

BOOTLOADER:=$(BUILD_DIR)/bootloader/bootloader.o
OS:=$(BUILD_DIR)/os/sample.o
DISK_IMG:=$(BUILD_DIR)/disk.img

# BOOTLOADER_SRCS := $(wildcard $(SRC_DIR)/*.asm)
# BOOTLOADER_OBJS := $(patsubst $(SRC_DIR)/%.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))

# $(shell mkdir -p $(BUILD_DIR))
# $(shell rm -r $(BUILD_DIR)/*)

all: bootdisk

.PHONY: bootdisk bootloader os

bootloader:
	make -C bootloader

os:
	make -C os

bootdisk: bootloader os
	dd if=/dev/zero of=$(DISK_IMG) bs=512 count=2880
	dd conv=notrunc if=$(BOOTLOADER) of=$(DISK_IMG) bs=512 count=1 seek=0
	dd conv=notrunc if=$(OS) of=$(DISK_IMG) bs=512 count=1 seek=1

qemu:
	qemu-system-i386 -machine q35 -fda $(DISK_IMG) -gdb tcp::26000 -S
	gdb -ex os_gdb

clean:
	make -C bootloader clean
	make -C os clean
