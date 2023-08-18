-- Learn utilizing Lua (5.4)
-- Author:	Martin Schuler

local games = require "games"
local args = {...}

function Table_contains(tbl, x)
	local found = false
	for _, v in pairs(tbl) do
		if v == x then
			found = true
		end
	end
	return found
end

-- Cli Help
local function phelp()
	print [[Usage: lua main.lua [OPTION]
Options:
  help    Show this help
  guess   A basic guessing game
  maze    A simplistic maze game
]]
end

if #args < 1 then
	phelp()
	os.exit(1)
end

local cmd = args[1]
local validHelps = { "help", "h", "-h", "?" }

if (Table_contains(validHelps, cmd)) then
	phelp()
elseif cmd == "guess" then
	games:guess()
elseif cmd == "maze" then
	games:maze()
else
	print("Unknown command:", cmd)
end
