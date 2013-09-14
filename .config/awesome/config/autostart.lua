-- Настройка экранов
run("xrandr --output DVI-I-0 --mode 2048x1152")
run("xrandr --output DVI-I-1 --mode 1400x1050 --right-of DVI-I-0")


run("wmname LG3D") --Для Java
run("setxkbmap -layout 'us,ru(winkeys)' -option 'lv3:ralt_switch,misc:typo,altwin:menu,compose:menu,grp:alt_caps_toggle,terminate:ctrl_alt_bksp'") -- Настройки раскладок клавиатуры


run_once("xscreensaver", "-no-splash") -- Скринсейвер
run_once("nm-applet", "--sm-disable") -- Монитор сетевых подключений
run_once("parcellite") -- Монитор буфера обмена
--run_once("mpd") -- Музыка
--todo: cmus


run("sbxkb") -- Флажок раскладки


run_once("psi-plus")
-- run_once("skype")