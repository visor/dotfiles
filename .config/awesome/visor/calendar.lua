local string = string
local tostring = tostring
local os = os
local capi = {
	mouse = mouse,
	screen = screen
}
local awful = require("awful")
local naughty = require("naughty")
module("visor.calendar")

local calendar = {}
local current_day_format = "<b>%s</b>"

function displayMonth(month,year,weekStart)
	local t,wkSt=os.time{year=year, month=month+1, day=0},weekStart or 1
	local d=os.date("*t",t)
	local mthDays,stDay=d.day,(d.wday-d.day-wkSt+1)%7

	local lines = " "

	for x=0,6 do
		lines = lines .. os.date("%a ",os.time{year=2006,month=1,day=x+wkSt})
	end

	lines = lines .. "\n"

	local writeLine = 1
	while writeLine < (stDay + 1) do
		lines = lines .. "   "
		writeLine = writeLine + 1
	end

	for d=1,mthDays do
		local x = d
		local t = os.time{year=year,month=month,day=d}
		if writeLine == 8 then
			writeLine = 1
			lines = lines .. "\n"
		end
		if (#(tostring(d)) == 1) then
			x = "0" .. x
		end
		if os.date("%Y-%m-%d") == os.date("%Y-%m-%d", t) then
			x = string.format(current_day_format, x)
		end
		lines = lines .. " " .. x
		writeLine = writeLine + 1
	end
	local header = os.date(" %B %Y\n",os.time{year=year,month=month,day=1})

	return "<span font_desc='Consolas,14'>" .. header .. "</span>\n<span font_desc='Consolas,12'>" .. lines .. "</span>"
end

function switchNaughtyMonth(switchMonths)
	if (#calendar < 3) then return end
	local swMonths = switchMonths or 1
	calendar[1] = calendar[1] + swMonths
	calendar[3].box.widgets[2].text = string.format('<span font_desc="%s">%s</span>', "Consolas", displayMonth(calendar[1], calendar[2], 2))
end

function addCalendarToWidget(mywidget, custom_current_day_format)
	if custom_current_day_format then current_day_format = custom_current_day_format end

	mywidget:connect_signal('mouse::enter', function ()
		local month, year = os.date('%m'), os.date('%Y')
		calendar = {
			month,
			year,
			naughty.notify({
				text = string.format('<span font_desc="%s">%s</span>', "Consolas", displayMonth(month, year, 2)),
				timeout = 0,
				hover_timeout = 0.5,
				screen = capi.mouse.screen
			})
		}
	end)
	mywidget:connect_signal('mouse::leave', function () naughty.destroy(calendar[3]) end)
--[[
  mywidget:buttons(awful.util.table.join(
    awful.button({ }, 1, function()
        switchNaughtyMonth(-1)
    end),
    awful.button({ }, 3, function()
        switchNaughtyMonth(1)
    end),
    awful.button({ }, 4, function()
        switchNaughtyMonth(-1)
    end),
    awful.button({ }, 5, function()
        switchNaughtyMonth(1)
    end),
    awful.button({ 'Shift' }, 1, function()
        switchNaughtyMonth(-12)
    end),
    awful.button({ 'Shift' }, 3, function()
        switchNaughtyMonth(12)
    end),
    awful.button({ 'Shift' }, 4, function()
        switchNaughtyMonth(-12)
    end),
    awful.button({ 'Shift' }, 5, function()
        switchNaughtyMonth(12)
    end)
  ))
--]]
end