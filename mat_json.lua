json = assert(loadfile "json.lua")()

local function read_file(path)

	local open = io.open
	local file = open(path, "r")
	if not file then return nil end

	string = file:read "*a"
	
	file:close()

	return string
end

string = read_file(arg[1])

local decoded = json:decode(string)
print (decoded)
for i=1,3 do
	for j=1,3 do
		io.write(decoded[i][j])
	end
	io.write("\n")
end
