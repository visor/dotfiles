-- {{{ Rules
awful.rules.rules = {
	{
		rule = { },
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus        = true,
			keys         = clientkeys,
			buttons      = clientbuttons,
			size_hints_honor = false
		}
	},
	-- 1.dev
	{
		rule = { class = "Sublime_text" },
		properties = { tag = tags[1][1] }
	},
	{
		rule = { class = "jetbrains-phpstorm" },
		properties = { tag = tags[1][1] }
	},
	-- 2.web
	{
		rule = { class = "Firefox", role = "browser" },
		properties = {
			tag = tags[2][2],
			floating = false
		}
	},
	{
		rule = { class = "Firefox", instance = "Firebug" },
		properties = {
			tag = tags[2][1],
			floating = false
		}
	},
	{
		rule = { class = "Firefox", instance = "Devtools" },
		properties = {
			tag = tags[2][1],
			floating = false
		}
	},
	{
		rule = { class = "google-chrome", role = "browser" },
		properties = {
			tag = tags[2][2],
			floating = false
		}
	},
	{
		rule = { class = "google-chrome", role = "pop-up" },
		properties = {
			tag = tags[2][2],
			floating = true,
			callback = function (c) awful.placement.centered(c) end
		}
	},
	{
		rule = { class = "luakit" },
		properties = {
			tag = tags[2][2]
		}
	},
	-- 3.info
	{
		rule = { class = "Thunderbird" },
		properties = {
			tag = tags[1][3],
			floating = false
		}
	},
	{
		rule = { class = "Thunderbird", type = "dialog" },
		properties = {
			tag = tags[1][3],
			floating = true,
			callback = function (c) awful.placement.centered(c) end
		}
	},
	{
		rule = { class = "Mail" },
		properties = { tag = tags[1][3] }
	},
	-- 4.ims
	{
		rule = { class = "Xchat" },
		properties = {
			tag                  = tags[2][4],
			floating             = false,
			maximized_vertical   = true,
			maximized_horizontal = true
		},
	},
	{
		rule = { class = "Skype" },
		properties = {
			tag = tags[2][4],
			size_hints_honor = false
		}
	},
	{
		rule = { class = "Skype", name = "victor.karamzin - Skype™" },
		properties = {
			tag                  = tags[2][4],
			floating             = true,
			switchtotag          = true,
			maximized_vertical   = true,
			maximized_horizontal = false
		},
		callback = function (c) visor.imBuddy(c, 400, false); end
	},
	{
		rule = { class = "Pidgin" },
		properties = { tag = tags[2][4] }
	},
	{
		rule = { class = "Pidgin", role = "buddy_list" },
		properties = {
			tag                  = tags[2][4],
			floating             = true,
			maximized_vertical   = true,
			maximized_horizontal = true
		},
		callback = function (c) visor.imBuddy(c, 400, false); end
	},
	{
		rule_any = { class = { "Psi-plus" } }, except = { instance = "main" },
		properties = { tag = tags[2][4] }
	},
	{
		rule = { class = "Psi-plus", instance = "main" },
		properties = {
			tag = tags[2][4],
			floating             = true,
			maximized_vertical   = true,
			maximized_horizontal = true
		},
		callback = function (c) visor.imBuddy(c, 400, false); end
	},
	-- 5.med
	{
		rule = { class = "MPlayer" },
		properties = { floating = true, tag = tags[1][5] }
	},
	{
		rule = { icon_name = "live" },
		properties = { tag = tags[2][8] }
	},
	{
		rule = { class = "gimp" },
		properties = {
			tag = tags[1][4],
			floating = false

		}
	},
	{
		rule = { class = "Gimp" },
		properties = {
			tag = tags[1][4],
			floating = false

		}
	},
	{
		rule = { class = "Gimp", type = "dialog" },
		properties = {
			tag = tags[1][4],
			floating = true,
			callback = function (c) awful.placement.centered(c) end
		}
	},
	-- 7 (2) todo
	{
		rule = { class = "Cherrytree" },
		properties = {
			tag = tags[2][7],
			floating = false,
			maximized_vertical   = true,
			maximized_horizontal = true
		}
	},
	-- 9 (2) games
	{
		rule = { class = "einstein" },
		properties = {
			tag = tags[2][9],
			callback = function (c) awful.placement.centered(c) end
		}
	},
	{
		rule = { class = "dosbox" },
		properties = {
			tag = tags[2][9],
			callback = function (c) awful.placement.centered(c) end
		}
	},

	-- electronics (screen1, gr)
	{
		rule = { class = "Eagle" },
		properties = {
			tag = tags[1][4],
		}
	},
	{
		rule = { class = "Eagle", modal = true },
		properties = {
			tag = tags[1][4],
			callback = function (c) awful.placement.centered(c) end
		}
	},
	{
		rule = { class = "Kicad" },
		properties = {
			tag = tags[1][4],
		}
	},
	{
		rule = { class = "Kicad", modal = true },
		properties = {
			tag = tags[1][4],
			callback = function (c) awful.placement.centered(c) end
		}
	}
}
-- }}}