__setup() {

    alias svni='svn --set-depth immediates'
    alias svna='svn --set-depth infinity'
}

svn_prompt_line() {

    local str="$(svn_repo_get)@r$(svn_rev_get)"

    if [ x"$str" != x"@r" ]; then
	echo "${magenta}svn:[$str]${norm}"
    fi
}

svn_repo_get() {

    svn info | awk -F: '/Relative URL/ { print $2 }' | sed -e 's, ^/,,' 2>/dev/null
}

svn_rev_get() {

    svn info | awk -F: '/Revision/ { print $2 }' | sed -e 's, *,,' 2>/dev/null
}

__setup
