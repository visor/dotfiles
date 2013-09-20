function podcast() {
	nvlc --no-color -S podcast --podcast-urls "$@";
}

alias mplayer="mplayer -zoom -fs"
alias M='mplayer -vo x11 -fs -zoom'

alias img="feh -xdF"