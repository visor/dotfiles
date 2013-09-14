-- Настройка экранов
run("xrandr --output DVI-I-0 --mode 2048x1152")
run("xrandr --output DVI-I-1 --mode 1400x1050 --right-of DVI-I-0")


run("wmname LG3D") --Для Java
run("setxkbmap -layout 'us,ru' -model pc105 -variant nodeadkeys,intl") -- Настройки раскладок клавиатуры
run("setxkbmap -option")
run("setxkbmap -option 'grp:shift_toggle'")
run("setxkbmap -option 'misc:typo,lv3:ralt_switch,compose:menu'")
run("setxkbmap -option 'terminate:ctrl_alt_bksp'")


run_once("xscreensaver", "-no-splash") -- Скринсейвер
run_once("nm-applet", "--sm-disable") -- Монитор сетевых подключений
run_once("parcellite") -- Монитор буфера обмена
--run_once("mpd") -- Музыка
--todo: cmus


run("sbxkb") -- Флажок раскладки


run_once("psi-plus")
-- run_once("skype")