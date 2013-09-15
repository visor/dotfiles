local require  = require
local pairs    = pairs
local dofile   = dofile
local string   = require("string")
local table    = require("table")
local client   = client
local awful    = require("awful")

local run      = awful.util.spawn
local dbg      = dbg
local tags     = tags
local terminal = terminal

module("visor.tmux")

debug        = false
tagNumber    = 6
screenNumber = 1
config       = {}
fileName     = nil
runCommand   = terminal .. " -n %s -title %s -e tmux -L %s"

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

	if (not backend) then
		backend = "tmux"
	end
	if (appConfig.title) then
		title = appConfig.title
	end

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

	local screen = config[name].screen or screenNumber
	local tag    = config[name].tag or tagNumber
	local tmux = getTmux(name)
	awful.screen.focus(screen)
	awful.tag.viewonly(tags[screen][tag])
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