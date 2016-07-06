__setup() {

}

gh_paginate() {
    local url="$1"
    local auth="$2"

    local file=/tmp/gh.pagination.txt

    rm -f $file
    curl -i -s $(echo $auth) "$url" >> $file

    local next_url
    local prev=-1
    local num=0
    while [ : ]; do
	next_url="$(grep ^Link $file | tail -1 | awk '{ print $2 }'  |sed -e 's,[><;],,g')"
	prev=$num
	num=$(echo $next_url | sed -e 's,.*\=,,')
	[ -z "$num" ] && num=-2

	if [ $prev -gt $num ]; then
	    break
	fi

	curl -i -s $(echo $auth) $next_url >> $file
	break
    done

    cat $file
    rm -f $file
}

gh_list_all_orgs() {
    local gh="$1"
    local pass="$2"
    local auth="$3"

    gh_paginate "${gh}/organizations" "$auth" | awk '/login/{ print $2 }' | sed -e 's/[",]//g' | sort
}

gh_clone_org_repos() {
    local gh="$1"
    local gh_api="$2"
    local org="$3"
    local dir="$4"
    local auth="$5"

    local repos="$(gh_paginate "${gh_api}/orgs/${org}/repos" "$auth")"
    repos=$(echo $repos | awk '/full_name/{ print $2 }' | sed -e 's/[",]//g' -e "s,$org/,,g" | sort)

    run_parallel "0" "8" "$repos" "gh_clone_or_pull_repo" "$gh" "$org" "$dir"
}

gh_clone_or_pull_repo() {
    local gh="$1"
    local org="$2"
    local dir="$3"
    local repo="$4"

    [ -d $dir/$org/$repo ] && return

    if [ -d $dir/$org/$repo ]; then
	echo "=====> $repo [pull]"
	(cd $dir/$org/$repo ; git pull -q)
    else
	echo "=====> $repo [clone]"
	mkdir -p $dir/$org/$repo
	(cd $dir/$org ; git clone -q --depth 1 ${gh}/${org}/${repo}.git > /dev/null)
    fi
}

__setup
