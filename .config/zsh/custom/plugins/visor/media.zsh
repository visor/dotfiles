function podcast() {
	nvlc --no-color -S podcast --podcast-urls "$@"
}

function live() {
	livestreamer -p 'mplayer -vo x11' "$1" best
}

alias mplayer="mplayer -zoom -fs"
alias M='mplayer -vo x11 -fs -zoom'
alias img="feh -xdF"