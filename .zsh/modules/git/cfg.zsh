__setup() {

    alias g=git

    eval "$(hub alias -s)"
    zplug 'sorin-ionescu/prezto', from:github, use:'modules/git/*.zsh'
}

git_prompt_line() {

    local str="$(git_repo_get)($(git_branch_get)): $(git_short_sha_get): $(git_tremble)"
    if [ x"$str" != x"(): : " ]; then
	echo "${magenta}git:   [$str]${norm}"
    fi
}

git_tremble() {

  git log --graph --pretty=format:'%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative -1 2>/dev/null
}

git_checkpoint() {

    git commit -am "checkpoint"
    git push -u
}


git_repo_get() {

    git remote show origin -n 2>/dev/null | awk '/Fetch URL/{ print $3 }' | cut -d / -f 4,5 | sed -e 's,\.git$,,'
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
