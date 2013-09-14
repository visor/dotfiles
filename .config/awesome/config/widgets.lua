local function createWidget(...)
	local options = {}
	local arg = {...}
	if type(arg[#arg]) == "table" then
		options = table.remove(arg)
	end

	local w = options.widget
	if not w then
		w = wibox.widget.textbox()
	end
	vicious.register(w, ...)

	local update = function()
		vicious.force(w)
	end

	if options.icon then
		local t = w
		local i = wibox.layout.margin(wibox.widget.imagebox(options.icon))
		i:set_margins(4)
		w = wibox.layout.fixed.horizontal()
		w:add(i)
		w:add(t)
		if options.icon_after then
			local i_after = wibox.layout.margin(wibox.widget.imagebox(options.icon_after))
			i_after:set_margins(4)
			w:add(i_after)
		end
	end
	if options.tooltip then
		awful.tooltip({ objects = {w}, timer_function = options.tooltip })
	end
	if options.min_width then
		local old_fit = w.fit
		w.fit = function(...)
			x, y = old_fit(...)
			return math.max(options.min_width, x), y
		end
	end

	w.update = update
	return w
end


sepWidget = wibox.widget.textbox()
sepWidget:set_text(" ")

clockWidget = awful.widget.textclock(
	"<b><span font_desc='Consolas,14' color='#ffffff'> %H<span color='#cccccc'>:</span>%M<span font_desc='Consolas,10' color='#cccccc'>:%S</span></span></b>",
	1
)
calendar.addCalendarToWidget(clockWidget, "<span color='#ffffff' background='#ff7f00'><b>%s</b></span>")

memWidget = createWidget(vicious.widgets.mem, "<span font_desc='Consolas,10'>$1%</span>", 5, {
	icon = theme.icon_mem,
	tooltip = function()
		local text = awful.util.pread("ps --columns 120 axk -%mem,-%cpu o pid,%mem,args | head -n 20")
		text = awful.util.escape(text)
		text = text:gsub("^([^\n]+)\n", "<span color='#ffffff'>%1</span>\n", 1)
		return "<span font='Consolas 10' color='#cccccc'>" .. text .. "</span>"
	end
})

cpuWidget = createWidget(vicious.widgets.cpu, "<span font_desc='Consolas,10'>$1%</span>", 5, {
	icon = theme.icon_cpu,
	tooltip = function()
		local text = awful.util.pread("ps --columns 120 axk -%cpu,-%mem o pid,%cpu,args | head -n 20")
		text = awful.util.escape(text)
		text = text:gsub("^([^\n]+)\n", "<span color='#ffffff'>%1</span>\n", 1)
		return "<span font='Consolas 10' color='#cccccc'>" .. text .. "</span>"
	end
})

netWidget = createWidget(vicious.widgets.net, "<span font_desc='Consolas,10'><span color='#CC9393'>${em1 down_kb}</span> <span color='#7F9F7F'>${em1 up_kb}</span></span>", 5, {
	icon = theme.icon_down,
	icon_after = theme.icon_up,
	tooltip = function()
		local text = awful.util.pread("ifstat em1")
		text = awful.util.escape(text)
		text = text:gsub("^([^\n]+)\n", "<span color='#ffffff'>%1</span>\n", 1)
		return
			"<span font='Consolas 10' color='#cccccc'>"
			.. text
			.. "</span>"
	end
})

--[[
-- -- Keyboard map indicator and changer
-- "-layout 'us,ru(winkeys)' -option 'lv3:ralt_switch,misc:typo,altwin:menu,compose:menu,grp:alt_caps_toggle,terminate:ctrl_alt_bksp'"
switcher = {}
switcher.cmd = "setxkbmap"
-- switcher.options = "misc:typo,altwin:menu,compose:menu,grp:alt_caps_toggle,terminate:ctrl_alt_bksp"
switcher.options = "lv3:ralt_switch,misc:typo,altwin:menu,compose:menu,terminate:ctrl_alt_bksp"
switcher.layout = { { "US", "us,ru(winkeys)" }, { "RU", "ru(winkeys),us" } }
switcher.current = 1
switcher.widget = wibox.widget.textbox()
switcher.set = function (t)
	switcher.widget:set_markup("<span font_desc='Consolas,12' color='#7F9F7F'> <b>" .. t[1] .. " </b></span>")
	os.execute( switcher.cmd .. " -option ''" )
	os.execute( switcher.cmd .. " -layout '" .. t[2] .. "' -option '" .. switcher.options .. "'" )
end
switcher.switch = function ()
	dbg("switch")
	switcher.current = switcher.current % #(switcher.layout) + 1
	local t = switcher.layout[switcher.current]
	switcher.set(t)
end

-- Mouse bindings
switcher.widget:buttons(
	awful.util.table.join(awful.button({ }, 1, function () switcher.switch() end))
)
switcher.set(switcher.layout[switcher.current])
--]]