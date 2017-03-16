
SpdList = {
	[1] = { name = "a", own = 15, prof = 50, cooldown = 0 },
	[2] = { name = "b", own = 30, prof = 45, cooldown = 0 },
	[3] = { name = "c", own = 20, prof = 65, cooldown = 0 },
	[4] = { name = "d", own = 15, prof = 25, cooldown = 0 },
	[5] = { name = "e", own = 40, prof = 70, cooldown = 0 },
	[6] = { name = "f", own = 20, prof = 10, cooldown = 0 },
	[7] = { name = "g", own = 10, prof = 05, cooldown = 0 },
	[8] = { name = "h", own = 25, prof = 40, cooldown = 0 }
}

local function print_list(list)
	for i=1,8 do
		io.write(i,"\n")
		for m,n in pairs(SpdList[i]) do
			io.write(m," = ",n,"\n")	
		end
	end
end

local function min(a, b)
	if (a["own"] + a["prof"] + a["cooldown"]) < 
			(b["own"] + b["prof"] + b["cooldown"]) then
		return true
	end	
	return false
end

print_list(SpdList)

table.sort(SpdList, min)

io.write("\n--------------------\nSorted\n\n")

print_list(SpdList)

io.write("\n--------------------\nTurn: ", SpdList[1]["name"], "\n\n")
SpdList[1]["cooldown"] = 50

table.sort(SpdList,min)

print_list(SpdList)

