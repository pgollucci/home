__setup() {

    GITHUB_HOST=github.com
    GITHUB_URL=https://${GITHUB_HOST}
    GITHUB_API_HOST=api.${GITHUB_HOST}
    GITHUB_API_URL=https://${GITHUB_AP_HOST}
    GITHUB_API_VER=v3
}

gh_paginate() {
    local url="$1"
    local auth="$2"

    local dir=$(mktemp -d -t gh.pagination)
    local file=${dir}/output.txt

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
    done

    cat $file
    rm -f $dir
}

gh_api_orgs_list() {
    local gh="$1"
    local pass="$2"
    local auth="$3"

    gh_paginate "${gh}/organizations" "$auth" | awk '/login/{ print $2 }' | sed -e 's/[",]//g' | sort
}

gh_api_org_repos_list() {
    local gh_api="$1"
    local org="$2"
    local auth="$3"

    local repos="$(gh_paginate "${gh_api}/orgs/${org}/repos" "$auth")"
    echo $repos | _gh_repos_extract "$org"
}

gh_api_user_repos_list() {
    local gh_api="$1"
    local user="$2"
    local auth="$3"

    local repos=$(gh_paginate "${gh_api}/users/$user/repos?type=owner" "$auth")
    echo $repos | _gh_repos_extract "$user"
}

_gh_repos_extract() {
    local prefix="$1"

    awk '/full_name/{ print $2 }' | sed -e 's/[",]//g' -e "s,$prefix/,,g" | sort 
}

gh_api_org_repos_clone() {
    local gh="$1"
    local gh_api="$2"
    local org="$3"
    local dir="$4"
    local auth="$5"
    local parallel="${6:-8}"

    local repos=$(gh_api_org_repos_list "$gh_api" "$org" "$auth")
    run_parallel "0" "$parallel" "$repos" "gh_api_repo_clone_or_pull" "$gh" "$org" "$dir"
}

gh_api_user_repos_clone() {
    local gh="$1"
    local gh_api="$2"
    local user="$3"
    local dir="$4"
    local auth="$5"

    local repos=$(gh_api_user_repos_list  "$gh_api" "$user" "$auth")
    run_parallel "0" "8" "$repos" "gh_api_repo_clone_or_pull" "$gh" "$user" "$dir"
}

gh_api_repo_clone_or_pull() {
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

gh_thing_parse() {
    local thing="$1"

    if [[ ${thing} = /* ]]; then
	GH_REPO=
	GH=
	GH_VER=
    else
	local org_proj=${thing%%%*}
	GH_REPO=${org_proj}
	GH="${GITHUB_URL}${org_proj}"
	if [[ ${thing} = *%* ]]; then
	    GH_VER=${thing##*%}
	else
	    GH_VER=master
	fi
    fi
}

gh_oauth_token_get() {
    local gh_api="$1"
    local user="$2"
    local pass="$3"
    local note="$4"

    local output=$(curl -X POST -s -u ${user}:${pass} -d '{"scopes": ["repo", "user"], "note": "'${note}'"}' ${gh_api}/v3/authorizations  | egrep '"token"|"id"')

    local id=$(echo $output | awk '{ print $2 }' | sed -e 's/[", ]//g')
    local token=$(echo $output | awk '{ print $4 }' | sed -e 's/[", ]//g')

    GH_TOKEN=$token
    GH_TOKEN_ID=$id
}

gh_oauth_token_del() {
    local gh_api="$1"
    local user="$2"
    local pass="$3"
    local id="$4"

    curl -X DELETE -s -u ${user}:${pass} ${gh_api}/v3/authorizations/$id
}

git_repo_clone() {
    local uri="$1"
    local ver="$2"
    local repo="$3"

    local safe_repo=$(echo $repo | sed -e 's,/,_,g')

    local prefix="${safe_repo}.XXX"

    local dir=$(mktemp -d -t $prefix)
    (
	cd ${dir}
	git clone -q ${uri} .
	if [ -n "${ver}" ]; then
	    git checkout -q ${ver}
	fi
    )

    echo ${dir}
}

git_file_commit_to() {
    [ -z "${TEST_MODE}" ] || return

    local repo="$1"
    local original="$2"
    local dir="$3"
    local file="$4"
    local msg="$5"

    gh_thing_parse "${repo}"
    local clone_dir=$(git_repo_clone "${GH}" "" "${repo}")

    mkdir -p ${clone_dir}/${dir}
    cp ${original} ${clone_dir}/${dir}/${file}
    (
	cd ${clone_dir}
	git add ${dir}/${file}
	git commit -m "${msg}"
	git push
    ) > /dev/null
    rm -rf ${clone_dir}
}

__setup
