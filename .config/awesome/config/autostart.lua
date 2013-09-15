-- Настройка экранов
run("xrandr --output DVI-I-0 --mode 2048x1152 --output DVI-I-1 --mode 1280x1024 --right-of DVI-I-0")
run("tmux start-server")


run("wmname LG3D") --Для Java


run("setxkbmap -layout 'us,ru(winkeys)'") -- Настройки раскладок клавиатуры
run("setxkbmap -option")
run("setxkbmap -option 'grp:shift_toggle,misc:typo,lv3:ralt_switch,compose:menu,terminate:ctrl_alt_bksp'") -- рестарт иксов


run_once("xscreensaver", "-no-splash") -- Скринсейвер
run_once("nm-applet", "--sm-disable") -- Монитор сетевых подключений
run_once("parcellite") -- Монитор буфера обмена
--todo: cmus


run_once("sbxkb") -- Флажок раскладки


run_once("psi-plus")
-- run_once("skype")