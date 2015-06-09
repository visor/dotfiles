-- Настройка экранов
run("xrandr --output DVI-I-0 --mode 1920x1080 --output DVI-I-1 --mode 1920x1080 --right-of DVI-I-0")
run("tmux start-server")


run("wmname LG3D") --Для Java


-- Настройки раскладок клавиатуры
run("setxkbmap -layout 'us,ru(winkeys)' -option -option 'grp:shift_toggle,misc:typo,lv3:ralt_switch,compose:menu,terminate:ctrl_alt_bksp'")


run_once("xscreensaver", "-no-splash") -- Скринсейвер
run_once("nm-applet", "--sm-disable") -- Монитор сетевых подключений
run_once("parcellite") -- Монитор буфера обмена
--todo: cmus


run_once("sbxkb") -- Флажок раскладки


run_once("psi-plus")
-- run_once("skype")