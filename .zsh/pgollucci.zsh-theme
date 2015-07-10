_red="%{$fg[red]%}"
_yellow="%{$fg[yellow]%}"
_green="%{$fg[green]%}"
_blue="%{$fg[blue]%}"
_cyan="%{$fg[cyan]%}"
_magenta="%{$fg[magenta]%}"
_black="%{$fg[black]%}"
_white="%{$fg[white]%}"
_rc="%{$reset_color%}"

_t="${_cyan}%l${_rc}"
_u="${_cyan}%n${_rc}"
_h="${_yellow}%M${_rc}"
_p="${_green}%/${_rc}"

ZSH_THEME_GIT_PROMPT_PREFIX=
ZSH_THEME_GIT_PROMPT_SUFFIX=

std_info="[${_t}]${_u}@${_h}"
git_info="[${_red}$(git_prompt_info)${_rc} ${_red}$(git_prompt_short_sha)${_rc}]"
rbe_info="[${_magenta}$(rbenv_prompt_info)${_rc}]"
#ports_info="[b:$(poud_b) p:$(poud_ptree)]"
rv_info="rv=%?"

PROMPT='$std_info $git_info $rbe_info $rv_info
${_p}
'

export DIFF_OPTIONS=-u
export MYSQL_PS1="\v \u@\h:\p (\d)>"

unsetopt correct_all
