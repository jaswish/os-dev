OS_HOME=/home/jacob/os_dev
BUILD_DIR=$OS_HOME/build

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
qemu-system-i386 -machine q35 -fda $BUILD_DIR/disk.img -gdb tcp::26000 -S &
gdb -ex os_gdb
