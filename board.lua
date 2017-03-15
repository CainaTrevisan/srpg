function read_board(board_path)

	board = {}
	for i=0,3 do
		board[i] = {}
		for j=0,3 do
			board[i][j] = nil
		end
	end

	local open = io.open
	local file = open(board_path, "r")
	if not file then return nil end

	for i=0,3 do
		for j=0,3 do
			board[i][j] = file:read(1)	
		end
	end

	file:close()

	return board
end

function print_board(board)	
	for i=0,3 do
		for j=0,3 do
			print (board[i][j])
		end
	end
end

print (arg[1] .. arg[2])

local atkr_board = read_board(arg[1])
local defr_board = read_board(arg[2])

print_board(atkr_board)
--print_board(defr_board)

