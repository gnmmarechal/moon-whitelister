-- Moon Whitelister by gnmmarechal
-- This application is under the GPLv3 license.

-- Version: 1.0

function copyFile(input, output)
	inp = io.open(input, FREAD)
	if System.doesFileExist(output) then
		System.deleteFile(output)
	end
	out = io.open(output,FCREATE)
	size = io.size(inp)
	io.write(out, io.read(inp, 0, size), size)
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