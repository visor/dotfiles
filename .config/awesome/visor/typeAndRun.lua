local require = require

local awful   = require("awful")
local wibox   = require("wibox")
local naughty = require("naughty")
local string  = require("string")
local io      = require("io")
local table   = require("table")
local splut   = require("table")
local json    = require("json")

local mouse      = mouse
local client     = client
local screen     = screen
local run        = awful.util.spawn
local dbg        = dbg
local terminal   = terminal

module("visor.typeAndRun")

local prompt = nil
local box    = nil
local handlers = {}

local getBox = function()
	if box then
		return box
	end

	box = wibox({
		fg           = "#DCDCCC",
		bg           = "#1E2320",
		border_color = "#6F6F6F",
		border_width = 1
	});
	prompt = awful.widget.prompt()

	box.ontop  = true
	box.height = 40
	box:set_widget(prompt)

	return box
end

local handleCommand = function(command)
	local prefix = command:sub(1, 1)
	if handlers[prefix] then
		handlers[prefix].run(command:sub(2))
		return;
	end

	run(command)
end

local handleCompletion = function(command, cursorPos, nComplete)
	local prefix = command:sub(1, 1)
	if handlers[prefix] then
		local result, pos = handlers[prefix].complete(command:sub(2), cursorPos - 1, nComplete)
		return prefix .. result, pos + 1
	end

	return awful.completion.shell(command, cursorPos, nComplete, "zsh")
end

local runShell = function(text)
	run(terminal .. " -e " .. text)
end

local runMan = function(text)
	run(terminal .. " -e man " .. text)
end

local runCalc = function(expr)
	local result = awful.util.eval("return (" .. expr .. ")")
	naughty.notify({
		text    = '<span>' .. expr .. ' =\n</span><span >' .. result .. '</span>',
		screen  = mouse.screen,
		timeout = 10
	})
end

local runSsh = function(text)
	run(terminal .. " -e ssh " .. text)
end

local runTranslate = function(text)
end

local completeShell = function(command, cursorPos, nComplete)
	local result, pos = awful.completion.shell(command, cursorPos, nComplete, "zsh")
	return result, pos
end

local completeMan = function(command, cursorPos, nComplete)
	local pages = {}
	local m = 'IFS=: && find $(manpath||echo "$MANPATH") -type f -printf "%f\n" | cut -d. -f1'
	local c, err = io.popen(m)
	if c then
		while true do
			local manpage = c:read("*line")
			if not manpage then
				break
			end
			if manpage:find("^" .. command:sub(1, cursorPos)) then
				table.insert(pages, manpage)
			end
		end
		c:close()
	else
		dbg(err)
	end

	if #command == 0 then
		return command, cursorPos
	end
	if #pages == 0 then
		return command, cursorPos
	end

	while nComplete > #pages do
		nComplete = nComplete - #pages
	end

	return pages[nComplete], cursorPos
end

local completeCalc = function(command, cursorPos, nComplete)
	return command, cursorPos
end

local completeSsh = function(command, cursorPos, nComplete)
	local hosts, matches, filehandle = {}, {}, io.open(os.getenv("HOME") .. "/.ssh/config")
	for host in filehandle:read("*all"):gmatch("Host ([%w%p]+)") do
		table.insert(hosts, host)
	end
	filehandle:close()

	if #command == 0 or (cursorPos ~= #command + 1 and command:sub(cursorPos, cursorPos) ~= " ") then
		return command, cursorPos
	end

	for i, host in pairs(hosts) do
		if host:find("^" .. command:sub(1,cursorPos)) then
			table.insert(matches, host)
		end
	end

	if #matches == 0 then
		return command, cursorPos
	end

	while nComplete > #matches do
		nComplete = nComplete - #matches
	end
	return matches[nComplete], cursorPos
end

handlers['?'] = {
	run = runMan,
	complete = completeMan
}
handlers[':']= {
	run = runShell,
	complete = completeShell
}
handlers['=']= {
	run = runCalc,
	complete = completeCalc
}
handlers['$']= {
	run = runSsh,
	complete = completeSsh
}
handlers['#']= {
	run = runTranslate,
	complete = completeCalc
}

show = function()
	local size = screen[mouse.screen].geometry;

	getBox()
	box.width = size.width - 200
	box.x = size.x + (size.width - box.width) / 2
	box.y = size.y + (size.height - box.height) / 2
	box.screen = mouse.screen
	box.visible = true

	awful.prompt.run(
		{ prompt = "", font = 'Consolas 20' },
		prompt.widget,
		handleCommand,
		handleCompletion,
		awful.util.getdir("cache") .. "/type_and_run_history",
		1000,
		hide
	)
end;

hide = function()
	getBox().visible = false
end