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

groupScreencast = {
	{ "&Left screen",  terminal .. " -e /home/visor/bin/recordings/left" },
	{ "&Right screen", terminal .. " -e /home/visor/bin/recordings/right" },
}

mainMenuItems = {
	{ "&Work",     groupWork },
	{ "&System",   groupSystem },
	{ "&Record",   groupScreencast },
	{ "—————————————————" },
	{ "&Awesome",  groupAwesome },
	{ "&Terminal", terminal }
}

mainmenu = awful.menu({
	items = mainMenuItems,
	theme = { width = 150 }
})
