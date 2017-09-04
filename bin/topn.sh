#!/bin/sh

main() {
    local n="$1"

    curl -Ls "http://support.bestfriends.org/site/TR/General?pg=team&fr_id=1332&team_id=6914" | \
	egrep 'team-roster-participant-raised|pg=personal' | \
	sed -e 's,.*">,,' -e 's,</a>,,' -e 's,</div>,,' -e 's,\$,,' | sed 'N;s/\n/ /' | \
	sort -r -n -k 3,3 | \
        head -n $n
}

main "$@"
exit $?
