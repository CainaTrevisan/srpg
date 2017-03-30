local json = assert (loadfile "json.lua")()

require "characters"
require "professions"

Current_Board = {}
for i=1,6 do
	Current_Board[i] = {}	
	for j=1,6 do
		Current_Board[i][j] = nil
	end
end

-- character positions provided by players
-- p1 is a boolean storing whether this is player 1's board or not
local function read_board(path, chars, p)
	local open = io.open
	local file = open(path, "r")	
	if not file then return nil end

	board = file:read "*a"

	file:close()

	board = json:decode(board)

	for i=1,3 do
		for j=1,3 do
			if board[i][j] ~= "-" then
				chars[board[i][j]] = Character:copy(Character[board[i][j]])
				chars[board[i][j]]["p1"] = p
			end
		end
	end

--	Character:print(chars[#chars])

	return board
end

-- faster character
local function faster_char(a, b)
	local spda = a["spd"] + a["prof"]["spd"] + a["cldwn"]
   	local spdb = b["spd"] + b["prof"]["spd"] + b["cldwn"]	

	if (spda < spdb) then
		return true
	elseif (spda == spdb) then
		if (not a.p1 and b.p1) then
			return false
		else 
			return true 
		end
	end
	return false
end	

local function show_battlefield(chars, boardp1, boardp2)
	
	local p

	-- print characters ordered by speed
	for k,i in ipairs(chars) do
		if i["p1"] then p = "p1" else p = "p2" end
		io.write(i.name," ",p," >> ")
	end
	io.write("\n_____________________________________\n")

	-- print boards
	io.write("  P1             P2\n")
	for i=1,3 do
		for j=1,3 do
			if boardp1[i][j] == "-" then
				io.write("  ", "--")
			else 
				io.write("  ", boardp1[i][j])
			end
		end
		io.write("  |")
		for j=1,3 do
			if boardp2[i][j] == "-" then 
				io.write("  ", "--")
			else 
				io.write("  ", boardp2[i][j])
			end
		end
		io.write("\n")

	end
end

function resolve_atk(atkr, defr)

	-- Resolve Defender damage
	dmg = math.ceil(( ( atkr["troops"] * (atkr["prof"]["atk"]+atkr["atk"]) ) ^ 1.27 - 
		  				( defr["troops"] * (defr["prof"]["def"]*1.5+defr["def"])) ^ 1.1 ) *.01 )

	defr["troops"] = defr["troops"] - dmg
	
	-- Resolve Attacker damage
	dmg = math.ceil(( ( defr["troops"] * (defr["prof"]["atk"]+defr["atk"]) ) ^ 1.25 - 
		  				( atkr["troops"] * (atkr["prof"]["def"]*1.5+atkr["def"])) ^ 1.1 ) *.01 )

	atkr["troops"] = atkr["troops"] - dmg

--	attacker["actions"] = attacker["actions"] - 1
end


-- Main
local p1 = true
chars = {}
chars_by_spd = {}
local boardp1 = read_board(arg[1], chars, true)
local boardp2 = read_board(arg[2], chars, false)

for k,i in pairs(chars) do
	table.insert(chars_by_spd, i)
end

while true do

	table.sort(chars_by_spd, faster_char)
	
	for k,i in pairs(chars) do
		Character:print()
	end

	show_battlefield(chars_by_spd, boardp1, boardp2)

	io.write("\nIt's P1's ", chars_by_spd[1].name, " turn\nWhat will you do?\n1) Attack\n2) Skip\n\n")

	c = io.read()
	if c == 1 then
		io.write("Who will you attack?\n")
		c = io.read()

		for i=1,3 do
			for j=1,3 do
				if p1 then 
					if c == boardp2[i][j] then
						resolve_atk(chars_by_spd[1], chars[boardp2[i][j]])
					end
				else
					if c == boardp1[i][j] then
						resolve_atk(chars_by_spd[1], chars[boardp1[i][j]])
					end
				end
			end
		end
	elseif c == 2 then
	end
	
	chars_by_spd[1].cldwn = chars_by_spd[1].cldwn + 50	
	
	p1 = not p1
end
