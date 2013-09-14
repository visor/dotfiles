groupAwesome = {
	{ "manual",  terminal .. " -e man awesome" },
	{ "config",  editor_cmd .. " ~/.config/awesome" },
	{ "restart", awesome.restart },
	{ "quit",    awesome.quit }
}

groupSystem = {
	{ "shutdown", 'dbus-send --system --print-reply --dest="org.freedesktop.login1" /org/freedesktop/login1 org.freedesktop.login1.Manager.PowerOff boolean:true' },
	{ "reboot",   'dbus-send --system --print-reply --dest="org.freedesktop.login1" /org/freedesktop/login1 org.freedesktop.login1.Manager.Reboot boolean:true' }
}

groupChats = {
}

groupWork = {
}

groupBrowsers = {
}

mainMenuItems = {
	{ "awesome",  groupAwesome },
	{ "system",   groupSystem },
	{ "terminal", terminal }
}

mainmenu = awful.menu({ items = mainMenuItems })
