local string = string
local tostring = tostring
local os = os
local capi = {
	mouse = mouse,
	screen = screen
}
local awful   = require("awful")
local naughty = require("naughty")
local wibox   = require("wibox")

module("visor.calendar")

local current_day_format = "<b>%s</b>"
local margin = 5
local calendar = {
	month  = os.date('%m'),
	year   = os.date('%Y'),
	margin = wibox.layout.margin(),
	widget = wibox.widget.textbox(),
	box    = wibox({
		fg           = "#DCDCCC",
		bg           = "#1E2320",
		border_color = "#6F6F6F",
		border_width = 1
	}),
}

calendar.widget:set_valign('top')
calendar.widget:set_align('left')

calendar.box.ontop  = true

calendar.margin:set_widget(calendar.widget)
calendar.margin:set_margins(margin)
calendar.box:set_widget(calendar.margin)
calendar.update = function()
	calendar.widget:set_markup(string.format(
		'<span font_desc="%s">%s</span>',
		"Consolas 12",
		displayMonth(calendar.month, calendar.year, 2)
	))
	local w, h = calendar.widget:fit(-1, -1)
	calendar.box.width  = w + 2*margin
	calendar.box.height = h + 2*margin
end

calendar.show = function(month, year)
	calendar.month = month
	calendar.year  = year
	calendar.update()

	local area = capi.screen[capi.mouse.screen].workarea
	local x = area.x + area.width - calendar.box.width - margin
	local y = area.y + margin

	calendar.box.screen = capi.mouse.screen
	calendar.box.x = x
	calendar.box.y = y
	calendar.box.visible = true
end

calendar.hide = function()
	calendar.box.visible = false
end


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

	return "<b>" .. header .. "</b>\n" .. lines
end

function switchNaughtyMonth(switchMonths)
	local swMonths = switchMonths or 1

	calendar.month = calendar.month + swMonths
	calendar.update()
end

function addCalendarToWidget(targetWidget, custom_current_day_format)
	if custom_current_day_format then
		current_day_format = custom_current_day_format
	end

	targetWidget:connect_signal('mouse::enter', function ()
		calendar.show(os.date('%m'), os.date('%Y'))
	end)

	targetWidget:connect_signal('mouse::leave', function ()
		calendar.hide()
	end)

	targetWidget:buttons(awful.util.table.join(
		awful.button({         }, 1, function() switchNaughtyMonth(-1) end),
		awful.button({         }, 3, function() switchNaughtyMonth( 1) end),
		awful.button({         }, 4, function() switchNaughtyMonth(-1) end),
		awful.button({         }, 5, function() switchNaughtyMonth( 1) end),
		awful.button({ 'Shift' }, 1, function() switchNaughtyMonth(-12) end),
		awful.button({ 'Shift' }, 3, function() switchNaughtyMonth( 12) end),
		awful.button({ 'Shift' }, 4, function() switchNaughtyMonth(-12) end),
		awful.button({ 'Shift' }, 5, function() switchNaughtyMonth( 12) end)
	))
end