-- Guess 1-100
-- 
-- A simple guessing game using random numbers
--

local function guess_100()
	print "Try to guess the correct number from 1-100!"

	local secret = math.random(1, 100)
	local cntr = 1
	local maxguess = 12

	while (cntr < maxguess) do
		print "Please input your guess:"

		-- local guess = io.read("*number")
		local guess = tonumber(io.read("*l"))

		if (guess ~= nil) then
			if guess == secret then
				print("Bravo, you guessed " .. guess .. " in " .. cntr .. " attempts! 🥳")
				break
			elseif guess < secret then
				print "Your guess is too LOW ...👆"
			elseif guess > secret then
				print "Your guess is too HIGH ...👇"
			end
		else
			print "Invalid input. Try again."
			-- io.read("*l")
		end
		cntr = cntr + 1

	end
	if (cntr == maxguess) then
		print "The End. Try a better strategy next time..."
	end

end


-- Maze
-- 
-- Find a way out of the maze
--
--[[ 
	Following static maze pattern is defined as of now, starting from R1

	R1 - R2 - R3
	R4   R5   R6
		 R7

	Whereas each room is interconected horizontaly and connected by a dash
	vertically. So there is three dead ends R4, R6 and R7. The goal is to 
	find R7.

	TODO
		- show maze options of current room
		- perfect maze generation
		- visuals and stuff

]]

local function maze_play()
	local rooms = 	{{east=2, south=4},{west=1, south=5, east=3},{west=2, south=6}, -- Level Design
					 {north=1},{north=2,south=7},{north=3},{north=5}}
	local possible_exits = {4, 7, 6}
	local exit = possible_exits[math.random(1, 3)]
	local currentRoom = 1 -- Starting Room
	local cntr = 1
	local maxguess = 30

	print [[You wake up\n ...you are in a dark room. Try to Figure a way out!\n

Orient yourself with "east", "west", "north" and "south".
Abort with "quit".

]]
	while (cntr < maxguess) do
		local decision = tostring(io.read("*l"))
		local move = {"east", "west", "north", "south"}
		
		if (Table_contains(move, decision) ~= true) then
			print "Invalid input. Enter east, west, north or south."
		end

		local room = rooms[currentRoom][decision]

		if not room then
			room = currentRoom
			print("It is just a wall here...")
		elseif room == exit then
			print("Free!")
			break
		else
			currentRoom = room
		end
		cntr = cntr + 1

	end
	if (cntr == maxguess) then
		print "The End. Try a better strategy next time..."
	end

end

return {
	guess = guess_100,
	maze = maze_play,
}
