local require  = require
local pairs    = pairs
local dofile   = dofile
local string   = require("string")
local table    = require("table")
local client   = client
local awful    = require("awful")

local run      = awful.util.spawn
local dbg      = dbg
local terminal = terminal

module("visor.tmux")

debug      = false
tag        = nil
config     = {}
fileName   = nil
runCommand = terminal .. " -n %s -title %s -e tmux -L %s"

local defaultIcon = "/usr/share/icons/gnome/32x32/applications/terminal.png"

local getTmux = function(name)
	for k, c in pairs(client.get()) do
		if name == c.icon_name then
			return c
		end
	end
end

local getCommand = function(name)
	local appConfig = config[name]
	local session   = table.concat(appConfig.session, " \\; ")
	local title     = name
	-- local icon      = defaultIcon

	if (not backend) then
		backend = "tmux"
	end
	if (appConfig.title) then
		title = appConfig.title
	end
	-- if (appConfig.icon) then
	-- 	icon = appConfig.icon
	-- end

	-- return string.format(runCommand, name, title, icon, name) .. " " .. session
	return string.format(runCommand, name, title, name) .. " " .. session
end

show = function(name)
	if (fileName) then
		dofile(fileName)
	end

	if (not config[name]) then
		dbg(name .. " не определён")
		return
	end

	local tmux = getTmux(name)
	awful.tag.viewonly(tag)
	if (tmux) then
		client.focus = tmux
		tmux:raise()
		return
	end

	if debug then
		dbg(getCommand(name))
	end
	run(getCommand(name))
end