function pas() {
	l=${1:-20}
	res=`tr -dc "A-Za-z0-9!@#$%^" < /dev/urandom | head -c ${l}`
	echo $res | xclip -selection clip-board
	echo $res
}