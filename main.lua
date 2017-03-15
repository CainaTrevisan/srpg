local class = require 'lupy'
local json = assert (loadfile "json.lua")()

Current_Board = {}
for i=1,6 do
	Current_Board[i] = {}	
	for j=1,6 do
		Current_Board[i][j] = nil
	end
end

Boards = {}
Professions = {}
Characters = {}

--pre-determined professions
local function read_profs(path)
	local open = io.open
	local file = open(path, "r")	
	if not file then return nil end

	profs = file:read "*a"

	file:close()

	Professions = json:decode(profs)

--	for i,j in pairs(Professions) do
--		print("Profession", i)
--		for m,n in pairs(j) do
--	    	print (m, n)
--		end	
--		print('\n')
--	end

end

-- pre-determined characters
local function read_chars(path)
	local open = io.open
	local file = open(path, "r")	
	if not file then return nil end

	chars = file:read "*a"

	file:close()

	Characters = json:decode(chars)

	for i,j in pairs(Characters) do
		print("Character", i)
		for m,n in pairs(j) do
	    	print (m, n)
		end	
		print('\n')
	end

end

-- character positions provided by players
local function read_board(path)
	local open = io.open
	local file = open(path, "r")	
	if not file then return nil end

	boards = file:read "*a"

	file:close()

	Boards = json:decode(boards)

	for i,j in pairs(Boards) do
		print("Board", i)
		for m,n in pairs(j) do
			for p=1,3 do
	    		io.write(n[p])
			end
			print('\n')
		end	
		print('\n')
	end

end

-- Main

local profs = read_profs(arg[1])
local chars = read_chars(arg[2])
local board = read_board(arg[3])


