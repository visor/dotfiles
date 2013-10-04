local require = require
local mouse      = mouse
local client     = client
local run        = awful.util.spawn
local dbg        = dbg
local terminal   = terminal
local __dir__    = __dir__

module("visor.netPopup")

show = function ()
--[[
	tooltip = function()
		local text = awful.util.pread("ifstat em1")
		local text = awful.util.pread("sudo nethogs em1")
		text = awful.util.escape(text)
		-- text = text:gsub("^([^\n]+)\n", "<span color='#ffffff'>%1</span>\n", 1)
		return
			"<span font='Consolas 10' color='#cccccc'>"
			.. text
			.. "</span>"
	end
--]]
--	dbg('show network tool')
end

hide = function ()
--	dbg('hide network tool')
end