aws_include_service() {
    local service="$1"

    local base="$HOME/.zsh/modules/aws/lib/sh"

    local dir
    for dir in api uw; do
	local pdir="$base/$dir/$service"
	[ -d $pdir ] || continue

	local files=$(cd $pdir ; ls -1)

	local file
	for file in $(echo $files); do
	    DEBUG=1 load_file "$pdir/$file"
	done
    done
}
