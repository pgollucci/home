__setup() {

    alias g=git

    eval "$(hub alias -s)"
    zplug 'sorin-ionescu/prezto', from:github, use:'modules/git/*.zsh'
}

git_prompt_info() {

    local str="$(git_repo_get)($(git_branch_get)) $(git_short_sha_get)$(git_dirty_get)"
    if [ x"$str" != x"() " ]; then
	echo "git:   [$str]"
    else
	echo "git:   []"
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

gh_clone_org_repos() {
    local gh="$1"
    local org="$2"
    local dir="$3"
    local user="$4"

    local repos="$(curl -s -i ${gh}/${org}/repositories | \
			 grep "href=\"/$org\/" | \
			 grep -v "class" | \
			 sed -e 's,.*="/,,' -e 's,".*,,' -e "s,$org/,," | \
			 sort)"

    local repo
    for repo in $(echo $repos); do
	if [ -d $dir/$org/$repo ]; then
	    echo "=====> $repo [pull]"
	    (cd $dir/$org/$repo ; git pull -q)
	else
	    echo "=====> $repo [clone]"
	    (cd $dir/$org ; git clone -q ${gh}/${org}/${repo}.git > /dev/null)
	fi
    done
}

__setup
