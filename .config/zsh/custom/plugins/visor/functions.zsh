function pas() {
	l=${1:-20}
	tr -dc "A-Za-z0-9!@#$%^" < /dev/urandom | head -c ${l} | xargs
}