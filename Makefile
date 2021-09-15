# $(info BOOTLOADER_OBJS is $(BOOTLOADER_OBJS))

OS_HOME:=/home/jacob/os_dev
BUILD_DIR:=$(OS_HOME)/build
SRC_DIR:=$(OS_HOME)/src

BOOTLOADER:=$(BUILD_DIR)/bootloader.o
OS:=$(BUILD_DIR)/sample.o
DISK_IMG:=$(BUILD_DIR)/disk.img

BOOTLOADER_SRCS := $(wildcard $(SRC_DIR)/*.asm)
BOOTLOADER_OBJS := $(patsubst $(SRC_DIR)/%.asm, $(BUILD_DIR)/%.o, $(BOOTLOADER_SRCS))

$(shell mkdir -p $(BUILD_DIR))
$(shell rm -r $(BUILD_DIR)/*)

all: bootdisk

# Generate our object files based on all assembly files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.asm
	nasm -f bin $< -o $@

bootdisk: $(BOOTLOADER_OBJS)
	# Create our disk image
	dd if=/dev/zero of=$(DISK_IMG) bs=512 count=2880
	#
	# Load our bootloader to the first sector of the floppy
	dd conv=notrunc if=$(BOOTLOADER) of=$(DISK_IMG) bs=512 count=1 seek=0
	#
	# Load our "OS" to the second sector of the floppy
	dd if=$(OS) of=$(DISK_IMG) bs=512 count=1 seek=1
