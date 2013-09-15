local keydoc = require("visor.keydoc")

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
	awful.button({ }, 3, function () mainmenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(globalkeys,
	awful.key({ modkey, }, "F1", keydoc.display),

	-- keydoc.group("Управление раскладкой клавиатуры"),
	-- awful.key({ "Control" }, "Shift_R", function() dbg("pres") end, switcher.switch, "Переключить раскладку"), -- Обработчик вешается на отпускание
	-- awful.key({ "Control" }, "a", function() dbg("press") end, function () dbg("release") end, "Переключить раскладку"), -- Обработчик вешается на отпускание

	keydoc.group(keydoc.defaultGroup),
	awful.key({ modkey }, "m", function () awful.tag.viewtoggle(awful.tag.selected(mouse.screen)) end, "Показать рабочий стол"),
	awful.key({ modkey }, "l",  function () run("xscreensaver-command -lock") end, "Заблокировать экран"),
	awful.key({ modkey }, "w",              function () mainmenu:show({ keygrabber=true }) end, "Показать меню Awesome"),
	awful.key({ modkey }, "Return",         function () awful.util.spawn(terminal) end, "Терминал"),
	-- awful.key({        }, "XF86Calculator", function () run("gnome-calculator") end, "Калькулятор"),
	awful.key({        }, "#161",           function () run("gnome-calculator") end, "Калькулятор"),
	awful.key({        }, "Print",          function () run("scrot") end, "Сделать скриншот"),
	awful.key({ modkey }, "Print",          function () run("shot") end, "Поделиться скриншотом"),

	keydoc.group("Scratch pad"),
	-- awful.key({ modkey }, "t", function () scratch.drop("urxvt -name scratch", "center", "center",  1280, 1000) end, "Терминал"),
	-- awful.key({ modkey }, "e", function () scratch.drop("urxvt -name mc -e mc", "center", "center", 1280, 1000) end, "Midnight Commander"),
	awful.key({ modkey }, "e", function () tmux.show("files") end, "Midnight Commander"),
	awful.key({ modkey }, "t", function () tmux.show("terminal") end, "Терминал"),
	awful.key({ modkey }, "u", function () tmux.show("tools") end, "Музыка, торренты и т.п."),
	awful.key({ modkey }, "c", function () scratch.drop("cherrytree", "center", "center",           1280, 1000) end, "Заметки"),
	-- awful.key({ modkey, "Control" }, "m", function ()
	-- 	scratch.drop("urxvt -title MOCPlayer -e mocp", "center", "center", 1280, 1000)
	-- end),

	keydoc.group("Музыка"),
	-- awful.key({           }, "XF86AudioMute",        function () music.volumeToggle() end, "Включить/выключить звук"),
	awful.key({           }, "#160",                 function () music.volumeToggle() end, "Включить/выключить звук"),
	-- awful.key({           }, "XF86AudioLowerVolume", function () music.volumeDown() end, "Уменьшить громкость"),
	awful.key({           }, "#174",                 function () music.volumeDown() end, "Уменьшить громкость"),
	-- awful.key({           }, "XF86AudioRaiseVolume", function () music.volumeUp() end, "Увеличить громкость"),
	awful.key({           }, "#176",                 function () music.volumeUp() end, "Увеличить громкость"),
	-- awful.key({           }, "XF86AudioPlay",        function () music.toggle() end, "Пауза/Играть"),
	awful.key({           }, "#162",                 function () music.toggle() end, "Пауза/Играть"),
	-- awful.key({ "Control" }, "XF86AudioPlay",        function () music.showInfo() end, "Что сейчас играет?"),
	awful.key({ "Control" }, "#162",                 function () music.showInfo() end, "Что сейчас играет?"),
	-- awful.key({ modkey    }, "XF86AudioLowerVolume", function () music.prev() end, "Предыдущий трек"),
	awful.key({ modkey    }, "#174",                 function () music.prev() end, "Предыдущий трек"),
	-- awful.key({ modkey    }, "XF86AudioRaiseVolume", function () music.next() end, "Следующий трек"),
	awful.key({ modkey    }, "#176",                 function () music.next() end, "Следующий трек"),
	-- awful.key({ modkey }, "XF86AudioMute",        function () run(mpc .. " shuffle") end, "Перемешать плейлист"),
	-- awful.key({ modkey }, "#160",                 function () run(mpc .. " shuffle") end),

	keydoc.group("Теги"),
	awful.key({ modkey }, "Left",  awful.tag.viewprev,        "Перейти на тег слева"),
	awful.key({ modkey }, "Right", awful.tag.viewnext,        "Перейти на тег справа"),
	awful.key({ modkey }, "`",     awful.tag.history.restore, "Предыдущий тег"),

	keydoc.group(keydoc.defaultGroup),
	awful.key({ modkey }, "Tab",
		function ()
			target = awful.client.focus.byidx( 1)
			if target then target:raise() end
		end),
	awful.key({ modkey, "Shift"   }, "Tab",
		function ()
			target = awful.client.focus.byidx(-1)
			if target then target:raise() end
		end),

	-- Layout manipulation
	keydoc.group("Управление раскладкой окон"),
	awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
	awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
	awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
	awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
	awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),

	awful.key({ modkey,           }, "a", function ()
		local aclients = {}
		for k, c in pairs(client.get()) do
			aclients[#aclients + 1] = {
				c.name,
				function ()
					awful.tag.viewonly(c:tags()[1])
					client.focus = c
					c:raise()
				end,
				c.icon
			}
		end

		local m = awful.menu({ items = aclients, theme = { width = 400 }})
		m:show({ keygrabber = true })
	end),

	awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
	awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
	awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
	awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
	awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
	awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

	-- awful.key({ modkey, "Control" }, "n", awful.client.restore),

	-- web dev layout
	keydoc.group("Веб раскладка"),
	awful.key({ modkey }, "/", function()
		awful.layout.webdev.center = not awful.layout.webdev.center
		awful.layout.set(awful.layout.webdev, tags[1][2])
	end, "С/Без колонкой под инструменты"),
	awful.key({ modkey }, "\\", function()
		local function reWidth(newWidth)
			awful.layout.webdev.width = newWidth
			awful.layout.set(awful.layout.webdev, tags[1][2])
		end

		local m = awful.menu({
			theme = { width = 400 },
			items = {
				{ "480", function() reWidth(480) end},
				{ "600", function() reWidth(600) end},
				{ "768", function() reWidth(768) end},
				{ "960", function() reWidth(960) end},
				{ "1024", function() reWidth(1024) end},
				{ "1280", function() reWidth(1280) end},
				{ "1440", function() reWidth(1440) end},
				{ "2048", function() reWidth(2048) end}
			}
		})
		m:show({ keygrabber = true })
	end, "Изменить ширину основной колонки"),

	-- Prompt
	keydoc.group("Запускатели"),
	awful.key({ modkey }, "r", function () typeAndRun.show() end, "Type and run"),
	awful.key({ modkey }, "x", function ()
		awful.prompt.run(
			{ prompt = "Run Lua code: " },
			barPrompt[mouse.screen].widget,
			awful.util.eval,
			nil,
			awful.util.getdir("cache") .. "/history_eval"
		)
	end, "Выполнить код Lua"),

	-- Всякие тесты
	-- keydoc.group("Всякие штуки на тестировании"),
	-- awful.key({ modkey            }, "=", function () typeAndRun.show() end, "Окно по середине экрана (что-то вроде type and run)"),

	keydoc.group("the end")
)

clientkeys = awful.util.table.join(
	awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
	awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
	awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
	awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
	awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
	-- awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
	-- awful.key({ modkey,           }, "n",      function (c) c.minimized = true               end),

	awful.key({ modkey,           }, "i",      dbg, "Свойства окна")
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
	keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
	globalkeys = awful.util.table.join(globalkeys,
		awful.key({ modkey }, "#" .. i + 9, function ()
			local screen = mouse.screen
			if tags[screen][i] then
				awful.tag.viewonly(tags[screen][i])
			end
		end),
		awful.key({ modkey, "Control" }, "#" .. i + 9, function ()
			local screen = mouse.screen
			if tags[screen][i] then
				awful.tag.viewtoggle(tags[screen][i])
			end
		end),
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function ()
			if client.focus and tags[client.focus.screen][i] then
				awful.client.movetotag(tags[client.focus.screen][i])
			end
		end),
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function ()
			if client.focus and tags[client.focus.screen][i] then
				awful.client.toggletag(tags[client.focus.screen][i])
			end
		end))
end

clientbuttons = awful.util.table.join(
	awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
	awful.button({ modkey }, 1, awful.mouse.client.move),
	awful.button({ modkey }, 3, awful.mouse.client.resize)
)

root.keys(globalkeys)