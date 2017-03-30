Profession = {
	Warrior = {	
		name = "Warrior",
		atk  = 5,
		def  = 2,
		spd  = 30 
	},
	Defender = {
		name = "Defender",
		atk  = 2,
		def  = 5,
		spd  = 30 
	},
	print = function (__self)
		for k,i in pairs(__self) do
			if i ~= __self.print then
				print(k) 
				for l,j in pairs(i) do
					print(l, j)
				end
				io.write('\n')
			end
		end
	end
}
