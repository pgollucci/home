__setup() {

    AWS_ORG=p6
    AWS_CREDENTIAL_FILE=$HOME/.aws/credentials
    AWS_ACCOUNT_MAP=$HOME/.aws/map-${AWS_ORG}

    path_if "${___dir}/bin"

    . ${___dir}/lib/_util.sh
    . ${___dir}/lib/_cfg.sh
    . ${___dir}/lib/_sts.sh
    . ${___dir}/lib/_shortcuts.sh

    alias sts='aws_sts_refresh'

    aws_setup
}

aws_prompt_line() {

  local aws="$(aws_sts_target_source_prompt_info)"
  local aws_source="$(aws_sts_source_prompt_info)"
  local sts="$(aws_sts_prompt_info)"

  [ -n "$aws" ] && echo "${magenta}aws:${norm}$aws"
  [ -n "$aws_source" ] && echo "${magenta}aws:${norm}$aws_source"
  [ -n "$sts" ] && echo "${magenta}sts:${norm}$sts"
}

aws_setup() {

    aws_shortcuts_unset
    aws_shortcuts_set
}

__setup
