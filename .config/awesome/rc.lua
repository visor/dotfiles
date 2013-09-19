awful           = require("awful")
awful.autofocus = require("awful.autofocus")
awful.rules     = require("awful.rules")
awful.util      = require("awful.util")
awful.layout    = require("awful.layout")
awful.widget    = require("awful.widget")
awful.wibox     = require("awful.wibox")
awful.remote    = require("awful.remote")
beautiful       = require("beautiful")
naughty         = require("naughty")
wibox           = require("wibox")
vicious         = require("vicious")
visor           = require("visor")
scratch         = require("scratch")

-- TODO: Это надо в отдельный конфиг {{{
modkey        = "Mod4"
terminal      = "urxvt"
editor        = "st"
editor_cmd    = "st"
run           = awful.util.spawn
globalkeys    = {}
tags          = {}
__dir__       = os.getenv('HOME') .. "/.config/awesome"

os.setlocale(os.getenv("LANG"))
-- }}}

function import(file)
	dofile(__dir__ .. "/" .. file .. ".lua")
end

import("config/errors")
import("config/helpers")

tmux       = require('visor.tmux')
music      = require('visor.music')
calendar   = require('visor.calendar')
typeAndRun = require('visor.typeAndRun')
network    = require('visor.netPopup')

import("config/layouts")
import("config/tags")
import("config/theme")
import("config/autostart")
import("config/naughty")
import("config/widgets")
import("config/menu")
import("config/tmux")
import("config/bindings")
import("config/titlebar")
import("config/rules")
import("config/signals")
