local run = awful.util.spawn

function cdnvideo(id)
	local player="mplayer -vo x11 -fs -zoom"
	local command=string.format(
		terminal .. " -name live -e livestreamer -p '%s' 'rtmp://aloha.cdnvideo.ru/rr3/%s.stream' best",
		player, id
	)
	run(command)
end

groupAwesome = {
	{ "&Manual",  terminal .. " -e man awesome" },
	{ "&Config",  editor_cmd .. " ~/.config/awesome" },
	{ "&Restart", awesome.restart },
	{ "&Quit",    awesome.quit }
}

groupSystem = {
	{ "&Shutdown", 'dbus-send --system --print-reply --dest="org.freedesktop.login1" /org/freedesktop/login1 org.freedesktop.login1.Manager.PowerOff boolean:true' },
	{ "&Reboot",   'dbus-send --system --print-reply --dest="org.freedesktop.login1" /org/freedesktop/login1 org.freedesktop.login1.Manager.Reboot boolean:true' }
}

groupChats = {
	{ "&psi",   "psi-plus" },
	{ "&Skype", "skype" },
}

groupWork = {
	{ "&PHPStorm", "phpstorm" }
}

groupBrowsers = {
}

groupTv = {
	{ "Первый канал", function () cdnvideo("339") end },
	{ "Россия 1",     function () cdnvideo("12972") end },
	{ "Россия 2",     function () cdnvideo("1257") end }
}

groupScreencast = {
	{ "&Left screen",  terminal .. " -e /home/visor/bin/recordings/left" },
	{ "&Right screen", terminal .. " -e /home/visor/bin/recordings/right" },
}

mainMenuItems = {
	{ "&Work",     groupWork },
	{ "&System",   groupSystem },
	{ "&TV",       groupTv },
	{ "&Record",   groupScreencast },
	{ "—————————————————" },
	{ "&Awesome",  groupAwesome },
	{ "&Terminal", terminal }
}

mainmenu = awful.menu({
	items = mainMenuItems,
	theme = { width = 150 }
})
