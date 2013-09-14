local require = require
local awful   = require("awful")
local naughty = require("naughty")
local io      = require("io")
local mouse   = mouse

module("visor.music")

backendName="cmus"
local backend = require("visor.music." .. backendName)
local run     = awful.util.spawn

volumeUp = function(value)
	run("amixer -c 0 -- sset Master playback 5dB+")
end

volumeDown = function(value)
	run("amixer -c 0 -- sset Master playback 5dB-")
end

volumeToggle = function(value)
	run("amixer set Master toggle")
end

showInfo = function()
	local f = io.open("/home/visor/.cmus/status.msg", "rb")
	local content = f:read("*all")
	f:close()

	naughty.notify({ text = content, timeout = 10, hover_timeout = 1, screen = mouse.screen })
end

isStarted = function()
	return backend.isStarted()
end

start = function()
	backend.start()
end

stop = function()
	backend.stop()
end

isPlaying = function()
	return backend.isPlaying()
end

next = function()
	backend.next()
end

prev = function()
	backend.prev()
end

toggle = function()
	backend.toggle()
end

play = function()
	backend.play()
end

pause = function()
	backend.pause()
end

current = function()
	return backend.current()
end

-- remove = function()
-- 	backend.remove()
-- end
--[[
⏴
⏸
⏹
⏩
⏪

									
🔉 🔊

--]]