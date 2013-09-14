beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- Поставить фон рабочего стола
run("feh --bg-scale /home/visor/.tools/wallpaper/03.jpg")

-- Иконки для виджетов
iconDir = __dir__ .. "/icons";
theme.icon_mem  = iconDir .. "/mem.png"
theme.icon_cpu  = iconDir .. "/cpu.png"
theme.icon_down = iconDir .. "/down.png"
theme.icon_up   = iconDir .. "/up.png"

theme.font = "Consolas 10"
theme.taglist_font = "Consolas 10"