require "professions"

Character = {
	s1 = {
		name   = "Soldier1",
		troops = 100,
		action = 3,
		atk    = 1,
		def    = 1,
		spd    = 50,
		cldwn  = 0,
		prof   = Profession["Warrior"]
	},
	s2 = {
		name   = "Soldier2",
		troops = 100,
		action = 3,
		atk    = 1,
		def    = 1,
		spd    = 50,
		cldwn  = 0,
		prof   = Profession["Defender"]

	},
	print = function (__self)
		for k,i in pairs(__self) do
			if i ~= __self.print then
				print (k)
				for l,j in pairs(i) do
					if j == __self[k].prof then
						print(l, __self[k].prof.name)
					else
						print(l, j)
					end
				end
				io.write("\n")
				end	
			end		
	end
}
