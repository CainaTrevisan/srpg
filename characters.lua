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
	print = function (__self, char)

		if char == nil then	

			-- print all characters in list
			for k,i in pairs(__self) do
				if type(i) ~= 'function' then
					print (k)
					for l,j in pairs(i) do
						-- if value references a profession print its name
						if j == __self[k].prof then
							print(l, __self[k].prof.name)
						else
							print(l, j)
						end
					end
					io.write("\n")
				end	
			end		

		else

			-- print the character received as argument
			for k,i in pairs(char) do
				if k == "prof" then
					print(k, char.prof.name)
				else
					print(k, i)
				end
				io.write("\n")
			end

		end

	end,
	
	copy = function(__self, char)
		new = {}
		
		for k,i in pairs(char) do
			new[k] = i
		end	

		return new	
	end
}
