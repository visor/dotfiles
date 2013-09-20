function _get_hosts() {
	ls -d1 -- /var/www/hosts/*/ | cut -d / -f 5
}

function _get_nano_commands() {
	nano | grep -v grep | grep '-' | cut -d ' ' -f 3
}

function _nano_comp() {
	compadd `_get_nano_commands`
}

function _goto_host_comp() {
	compadd `_get_hosts`
}

function goto_host() {
	cd /var/www/hosts/$1
}

alias n="nano"
alias gh="goto_host"
alias he="sudo $EDITOR /etc/hosts &"
alias hosts="cd /var/www/hosts"

alias -s {css,js,html}="$EDITOR"

compdef _goto_host_comp goto_host
compdef _nano_comp n
compdef _nano_comp nano