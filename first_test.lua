local class = require 'lupy'

Battlefield = {}
for i=1,6 do
	Battlefield[i] = {}
	for j=1,6 do
		Battlefield[i][j] = nil
	end
end

-- Professions:
Professions = {}

-- Assassin
Assassin = { ["name"] = "Assassin",
			 ["atk"] = 5,
             ["def"] = 5,
             ["spd"] = 1 }

Professions["Assassin"] = Assassin

class [[Character]]
    function __init__(self, name, troops, actions, atk, def, spd, prof)
        self.name = name
        self.troops = troops
		self.actions = actions
        self.atk = atk
        self.def = def
        self.spd = spd
		self.prof = prof
    end

    function print(self)
           print (self.name, self.troops, self.actions, self.atk, self.def, self.spd)
    end

_end()

local A = Character("A", 100, 2, 1, 1, 1, Assassin)
local B = Character("B", 100, 2, 1, 1, 1, Assassin)

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

local turns = 25

A.print()
B.print()

resolve_atk(A,B)

A.print()
B.print()


local open = io.open

local function read_file(path)
    local file = open(path, "r") 
    if not file then return nil end

    for i=0,3 do
		for j=0,3 do
			Battlefield[i][j] = file:read "*a"
		end
	end

    file:close()
end

local read_pos("atkr");
print (atkr_pos);

while turns>0 do

	

	turns=turns-1
end
