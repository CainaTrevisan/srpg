local class = require 'lupy'

-- Classes:

-- Assassin
Assassin = { ["atk"] = 50,
             ["def"] = 10,
             ["spd"] = 1}


class [[Character]]
    function __init__(self, name, troops, atk, def, spd)
        self.name = name
        self.troops = troops
        self.atk = atk
        self.def = def
        self.spd = spd
    end

    function print(self)
           print (self.name, self.troops, self.atk, self.def, self.spd)
    end

_end()

local A = Character("A", 100, 1, 1, 1)
local B = Character("B", 100, 1, 1, 1)

-- A >

-- base_atk (from class), troop size, atk lvl
-- base def (from class), troop size, def lvl

function resolve_atk(attacker, defender)
    attacker["troops"] = attacker["troops"] - defender["troops"]
end

A.print()

B.print()
