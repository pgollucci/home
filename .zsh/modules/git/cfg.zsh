__setup() {

    eval "$(hub alias -s)"

    alias g="git"
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

__setup
