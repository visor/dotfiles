local awful = require("awful")
local io = require("io")
local string = string
local dbg = dbg
-- local awful = require("awful.util")

module("visor.music.cmus")

local run = awful.util.spawn
local popen = io.popen
client = "cmus-remote -C"
local sendCommand = function(command)
	run(client .. " " .. command)
end

local getStatus = function ()
	local file = io.popen(client .." status")
	local result = file:read("*all")
	file:close()
	return result
end

local findCurrent = function()
	sendCommand("win-sel-cur")
end

isStarted = function()
end

start = function()
end

isPlaying = function()
	local state = string.gsub(string.match(getStatus(), "status %a*"),"status ","")
	return "playing" == state
end

next = function()
	sendCommand("player-next")
	findCurrent()
end

prev = function()
	sendCommand("player-prev")
	findCurrent()
end

toggle = function()
	sendCommand("player-pause")
	findCurrent()
end

play = function()
	sendCommand("player-play")
	findCurrent()
end

pause = function()
	sendCommand("player-pause")
	findCurrent()
end

stop = function()
	sendCommand("player-stop")
	findCurrent()
end

current = function()
-- информация о текущем треке
end

-- remove = function()
-- -- удалить трек из списка проигрывания
-- end