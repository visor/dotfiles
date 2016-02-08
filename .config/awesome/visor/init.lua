local naughty = require("naughty")
local awful   = require("awful")
awful.util    = require("awful.util")

require("visor.layout")

local exports = {}

function exports.imBuddy(client, width, pushLeft)
	local scr_area1 = screen[1].workarea
	local scr_area2 = screen[2].workarea
	local geometry  = nil

	if pushLeft then
		-- client:struts({left=width, right=0})
		geometry = {
			x     = scr_area1.width,
			y     = scr_area1.y,
			width = width
		}
	else
		--client:struts({right=width, left=0})
		geometry = {
			x     = scr_area1.width + scr_area2.width - width,
			y     = scr_area2.y,
			width = width
		}
	end

	-- dbg(scr_area2)
	-- dbg(geometry)
	-- client:struts({})
	awful.client.floating.set(client, true)
	client:geometry(geometry)
end

return exports