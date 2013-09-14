local naughty = require("naughty")
local awful   = require("awful")
awful.util    = require("awful.util")

require("visor.layout")

local exports = {}

function exports.imBuddy(client, width, pushLeft)
	local scr_area = screen[client.screen].workarea
	local cl_strut = client:struts()
	local geometry = nil

	if cl_strut ~= nil then
		if cl_strut.left ~= nil and cl_strut.left > 0 then
			geometry = {x=scr_area.x-cl_strut.left, y=scr_area.y,
						width=cl_strut.left}
		elseif cl_strut.right ~= nil and cl_strut.right > 0 then
			geometry = {x=scr_area.x+scr_area.width, y=scr_area.y,
						width=cl_strut.right}
		end
	end
	if geometry == nil then
		if pushLeft then
			client:struts({left=width, right=0})
			geometry = {x=scr_area.x, y=scr_area.y,
						width=width}
		else
			client:struts({right=width, left=0})
			geometry = {x=scr_area.x+scr_area.width-width, y=scr_area.y,
						width=width}
		end
	end
	client:geometry(geometry)
end

return exports