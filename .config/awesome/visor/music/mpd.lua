module("visor.music.mpd")

client = "mpc -p 6699"

local run = awful.util.spawn
local sendCommand = function(command)
	run(client .. " " .. command)
end

isStarted = function()
-- запущен ли демон?
end

start = function()
-- запустить демона
end

isPlaying = function()
-- играет ли сейчас что-нибудь?
end

next = function()
	sendCommand("next")
end

prev = function()
	sendCommand("prev")
end

toggle = function()
	sendCommand("toggle")
end

play = function()
	sendCommand("play")
end

pause = function()
	sendCommand("pause")
end

stop = function()
	sendCommand("stop")
end

current = function()
-- информация о текущем треке
end

-- remove = function()
-- -- удалить трек из списка проигрывания
-- end