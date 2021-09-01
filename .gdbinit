define os_gdb
	set architecture i8086
	target remote localhost:26000
	b *0x7c00
	layout asm
	layout reg
end

document os_gdb
	This command is used purely for setting up and debugging the os_dev environment because I am too lazy to type out all the commands.
end
