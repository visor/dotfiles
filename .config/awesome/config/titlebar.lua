barTop = {}
barPrompt = {}

tagList = {}
tagList.buttons = awful.util.table.join(
	awful.button({ },        1, awful.tag.viewonly),
	awful.button({ modkey }, 1, awful.client.movetotag),
	awful.button({ },        3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, awful.client.toggletag)--,
--  Не работают, починить надо
--	awful.button({ },        4, awful.tag.viewnext),
--	awful.button({ },        5, awful.tag.viewprev)
)

taskList = {}
taskList.buttons = awful.util.table.join(
	awful.button({ }, 1, function (c)
	if c == client.focus then
		c.minimized = true
	else
		if not c:isvisible() then
			awful.tag.viewonly(c:tags()[1])
		end
		client.focus = c
		c:raise()
	end
	end),
	awful.button({ }, 4, function ()
		target = awful.client.focus.byidx( 1)
		if target then target:raise() end
	end),
	awful.button({ }, 5, function ()
		target = awful.client.focus.byidx(-1)
		if target then target:raise() end
	end)
)

for s = 1, screen.count() do
	local left_layout  = wibox.layout.fixed.horizontal()
	local right_layout = wibox.layout.fixed.horizontal()
	local layout       = wibox.layout.align.horizontal()

	barPrompt[s] = awful.widget.prompt()
	tagList[s]   = awful.widget.taglist(s, awful.widget.taglist.filter.all, tagList.buttons)
	taskList[s]  = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, taskList.buttons)

	left_layout:add(tagList[s])
	left_layout:add(barPrompt[s])

	if s == 2 then
		right_layout:add(cpuWidget)
		right_layout:add(sepWidget)
		right_layout:add(memWidget)
		right_layout:add(sepWidget)
		right_layout:add(sepWidget)
		right_layout:add(wibox.widget.systray())
		right_layout:add(clockWidget)
	end

	-- right_layout:add(switcher.widget)

	layout:set_left(left_layout)
	layout:set_middle(taskList[s])
	layout:set_right(right_layout)

	barTop[s] = awful.wibox({ position = "top", screen = s, height = 24 })
	barTop[s]:set_widget(layout)
end