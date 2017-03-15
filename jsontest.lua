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
for key,value in pairs(decoded) do
	print (key .. " = " .. value)
end
