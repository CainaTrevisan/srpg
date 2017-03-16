--local class = require 'lupy'
local json = assert (loadfile "json.lua")()

Current_Board = {}
for i=1,6 do
	Current_Board[i] = {}	
	for j=1,6 do
		Current_Board[i][j] = nil
	end
end

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

	return Professions
end

-- pre-determined characters
local function read_chars(path)
	local open = io.open
	local file = open(path, "r")	
	if not file then return nil end

	chars = file:read "*a"

	file:close()

	Characters = json:decode(chars)

--	for i,j in pairs(Characters) do
--		print("Character", i)
--		for m,n in pairs(j) do
--	    	print (m, n)
--		end	
--		print('\n')
--	end

	return Characters
end

-- character positions provided by players
local function read_board(path)
	local open = io.open
	local file = open(path, "r")	
	if not file then return nil end

	board = file:read "*a"

	file:close()

	Board = json:decode(board)

--	for i,j in pairs(Board) do
--		print("Board", i)
--		for m,n in pairs(j) do
--			for p=1,3 do
--	    		io.write(n[p])
--			end
--			print('\n')
--		end	
--		print('\n')
--	end

	return Board
end

-- faster character
local function faster_char(a, b)
	if (a["spd"] + a["prof"] ) < () then	
		return true
	end
	return false
end	

-- Main

local Professions = read_profs(arg[1])
local Characters = read_chars(arg[2])
local boardp1 = read_board(arg[3])
local boardp2 = read_board(arg[4])

table.sort(Characters, faster_char)
