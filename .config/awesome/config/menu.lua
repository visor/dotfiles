local run = awful.util.spawn
local sep = { "—————————————————" }

function proTv(id, name)
	local rtmpBase  = "rtmp://178.218.212.102/rtplive"
	local httpBase  = "http://pro-tv.net"
	local streamUrl = rtmpBase .. "/" .. id .. ".stream"
	local swfUrl    = httpBase .. "/player/player.swf"
	local pageUrl   = string.format(httpBase .. "/%s-%s.html", id, name)
	local command = terminal .. " -n live -name live -e "
		.. __dir__ .. "/scripts/tv"
			.. " " .. streamUrl
			.. " " .. swfUrl
			.. " " .. pageUrl
			.. " " .. rtmpBase

	run(command)
	awful.screen.focus(1)
	awful.tag.viewonly(tags[1][5])
end

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
	{ "Первый канал", function () proTv(  "339", "pervyjj-kanal") end },
	{ "Россия 1",     function () proTv("12972", "rossija-1") end },
	{ "Россия 2",     function () proTv( "1257", "rossia-2") end },
	{ "CTC",          function () proTv( "1255", "sts") end },
	{ "НТВ",          function () proTv( "1256", "ntv") end },
	{ "Россия 24",    function () proTv(    "4", "vesti") end },
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
