local run = awful.util.spawn
local sep = { "—————————————————" }

function cdnvideo(id)
	local player="mplayer -vo x11 -fs -zoom"
	local command=string.format(
		terminal .. " -n live -name live -e livestreamer -p '%s' 'rtmp://aloha.cdnvideo.ru/rr3/%s.stream' best",
		player, id
	)
	run(command)
	awful.screen.focus(1)
	awful.tag.viewonly(tags[1][5])
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

groupWork = {
	{ "&PHPStorm", "phpstorm", __dir__ .. "/icons/apps/phpstorm.png" }
}

groupInternet = {
	{ "&Luakit", "luakit" },
	{ "&Firefox", "firefox" },
	{ "&Google Chrome", "google-chrome" },
	sep,
	{ "&Mail", "thunderbird"},
	sep,
	{ "&psi",   "psi-plus" },
	{ "&Skype", "skype" },
}

groupTv = {
	{ "Первый канал", function () cdnvideo("339") end },
	{ "Россия 1",     function () cdnvideo("12972") end },
	{ "Россия 2",     function () cdnvideo("1257") end },
	{ "CTC",          function () cdnvideo("1255") end },
}

groupScreencast = {
	{ "&Left screen",  terminal .. " -e /home/visor/bin/recordings/left" },
	{ "&Right screen", terminal .. " -e /home/visor/bin/recordings/right" },
}

mainMenuItems = {
	{ "&Work",     groupWork },
	{ "&Internet", groupInternet },
	{ "&TV",       groupTv },
	{ "&Record",   groupScreencast },
	sep,
	{ "&System",   groupSystem },
	{ "&Awesome",  groupAwesome },
	{ "&Terminal", terminal }
}

mainmenu = awful.menu({
	items = mainMenuItems,
	theme = { width = 150 }
})
