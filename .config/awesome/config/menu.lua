local run = awful.util.spawn
local sep = { "—————————————————" }

groupArduino = {
	{ "I&DE",         "/usr/programs/arduino/arduino", "/home/visor/.local/arduino.jpg" },
	{ "IDE (1.&5.7)", "/usr/programs/arduino-1.5.7/arduino", "/home/visor/.local/arduino.jpg" },
	{ "IDE (1.&0.5)", "/usr/programs/arduino-1.0.5/arduino", "/home/visor/.local/arduino.jpg" },
	sep,
	{ "&Fritzing",    "/usr/programs/fritzing/Fritzing", "/home/visor/.local/fritzing.png" },
	{ "&Eagle",       "/usr/programs/eagle/bin/eagle", "/usr/programs/eagle/bin/eagleicon50.png" }
}

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
	{ "&PHPStorm", "phpstorm", __dir__ .. "/icons/apps/phpstorm.png" },
	{ "&Sublime Text", "/usr/programs/sublime-text-3/sulime_text", "/usr/programs/sublime-text-3/Icon/32x32/sublime-text.png" },

	{ "&Oxygen", "/usr/programs/oxygen/oxygenDeveloper.sh" },
	{ "&BPM Modeler", "/usr/programs/modeler/modeler", "/usr/programs/modeler/icon.xpm" },
	{ "&Yaoqiang", "/usr/java/jdk1.7.0_45/bin/java -jar /usr/programs/yaoqiang/yaoqiang.jar" },
	
	{ "S&QLyog", "sqlyog" }
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

groupScreencast = {
	{ "&Left screen",  terminal .. " -e /home/visor/bin/recordings/left" },
	{ "&Right screen", terminal .. " -e /home/visor/bin/recordings/right" },
}

groupGames = {
	{ "&Einstein", "einstein" },
	{ "&DOSBox",   "dosbox" },
}

mainMenuItems = {
	{ "&Work",     groupWork,        "/usr/share/icons/gnome/256x256/categories/applications-development.png" },
	{ "&Internet", groupInternet,    "/usr/share/icons/gnome/256x256/categories/applications-internet.png" },
	sep,
	{ "Ar&duino", groupArduino,     "/home/visor/.local/arduino.jpg" },
	sep,
	{ "&Record",   groupScreencast },
	{ "&Games",    groupGames },
	sep,
	{ "&System",   groupSystem },
	{ "&Awesome",  groupAwesome },
	{ "&Terminal", terminal,        "/usr/share/icons/gnome/256x256/apps/gnome-terminal.png" }
}

mainmenu = awful.menu({
	items = mainMenuItems,
	theme = { width = 150, height = 24 }
})
