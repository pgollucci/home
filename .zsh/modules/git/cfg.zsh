__setup() {

    alias g=git

    eval "$(hub alias -s)"
    zplug 'sorin-ionescu/prezto', from:github, use:'modules/git/*.zsh'
}

git_prompt_line() {

    local str="$(git_repo_get)($(git_branch_get)) $(git_short_sha_get)$(git_dirty_get)"
    if [ x"$str" != x"() " ]; then
	echo "${magenta}git:   [$str]${norm}"
    fi
}

git_repo_get() {

    git remote show origin -n 2>/dev/null | awk '/Fetch URL/{ print $3 }' | sed -e 's,.*/,,' -e 's,.git,,'
}

git_branch_get() {

    local hide=$(git config --get oh-my-zsh.hide-status 2>/dev/null)
    if [ x"$hide" != x"1" ]; then
	local ref=$(git symbolic-ref HEAD 2> /dev/null)
	echo ${ref#refs/heads/}
    fi
}

git_dirty_get() {

    local gstatus="$(git status --porcelain 2>/dev/null | tail -1)"
    if [ -n "$gstatus" ]; then
	echo "*"
    fi
}

git_short_sha_get() {

    git rev-parse --short HEAD 2>/dev/null
}

gh_list_all_orgs() {
    local gh="$1"
    local pass="$2"
    local user=${3:-$USER}

    local file=/tmp/gh.orgs.txt
    rm -f $file

    local since=0
    while [ : ]; do
	curl -i -s -u "$user:$pass" -X GET "${gh}/organizations?since=$since" >> $file
	since="$(grep ^Link $file | tail -1 | awk '{ print $2 }' | sed -e 's,.*=,,' -e 's,[>;],,'g)"

	if ! echo $since | grep -q '^[0-9]*$'; then
	    break
	fi
    done

    cat $file | awk '/login/{ print $2 }' | sed -e 's/[",]//g' | sort
    rm -f $file
}

gh_clone_org_repos() {
    local gh="$1"
    local org="$2"
    local dir="$3"
    local user="${4:-$USER}"

    local repos="$(curl -s -i ${gh}/${org}/repositories | \
			 grep "href=\"/$org\/" | \
			 grep -v "class" | \
			 sed -e 's,.*="/,,' -e 's,".*,,' -e "s,$org/,," | \
			 sort)"

    local parallel=8
    local i=0
    (
	local repo
	for repo in $(echo $repos); do
	    ((i=i%parallel)); ((i++==0)) && wait
	    gh_clone_or_pull_repo "$gh" "$org" "$dir" "$repo" &
	done
    )
}

gh_clone_or_pull_repo() {
    local gh="$1"
    local org="$2"
    local dir="$3"
    local repo="$4"

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
