function pd () {
	[ -n "$1" ] && PORTSDIR=/usr/local/poudriere/ports/$1  && export PORTSDIR
	echo $PORTSDIR
}
