-- Moon Whitelister by gnmmarechal
-- This application is under the GPLv3 license.

-- Version: 1.0

-- Function from Sunshell (by Rinnegatamante)
MAX_RAM_ALLOCATION = 10485760

function copyFile(input,output)
	inp = io.open(input,FREAD)
	if System.doesFileExist(output) then
		System.deleteFile(output)
	end
	out = io.open(output,FCREATE)
	size = io.size(inp)
	index = 0
	while (index+(MAX_RAM_ALLOCATION/2) < size) do
		io.write(out,index,io.read(inp,index,MAX_RAM_ALLOCATION/2),(MAX_RAM_ALLOCATION/2))
		index = index + (MAX_RAM_ALLOCATION/2)
	end
	if index < size then
		io.write(out,index,io.read(inp,index,size-index),(size-index))
	end
	io.close(inp)
	io.close(out)
end

if System.doesFileExist("ur0:/game/launch/list_launch_vita.dat") then
	System.deleteFile("ur0:/game/launch/list_launch_vita.dat")
end

copyFile("app0:/list_launch_vita.dat", "ur0:/game/launch/list_launch_vita.dat")

if System.doesFileExist("ur0:/game/launch/list_launch_emu.dat") then
	System.deleteFile("ur0:/game/launch/list_launch_emu.dat")
end

copyFile("app0:/list_launch_emu.dat", "ur0:/game/launch/list_launch_emu.dat")

System.exit()