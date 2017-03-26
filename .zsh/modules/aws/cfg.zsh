__setup() {

    AWS_ORG=p6

    AWS_DIR=$HOME/.aws
    AWS_ACCOUNT_MAP=$AWS_DIR/map-$AWS_ORG
    AWS_CREDENTIAL_FILE=$AWS_DIR/credentials
    AWS_ASSUMED_CREDENTIAL_FILE=$AWS_CREDENTIAL_FILE-assumed
    AWS_SOURCE_CREDENTIAL_FILE=$AWS_CREDENTIAL_FILE-source

    path_if "${___dir}/bin"

    load_file "${___dir}/lib/util.sh"

    load_file "${___dir}/lib/_cfg.sh"
    load_file "${___dir}/lib/_shortcuts.sh"

    local service
    for service in ${___dir}/lib/svc_*.sh; do
	load_file "$service"
    done

    alias sts='aws_sts_refresh'

    aws_shortcuts
}

aws_prompt_line() {

  local aws="$(aws_sts_target_source_prompt_info)"
  local aws_source="$(aws_sts_source_prompt_info)"
  local sts="$(aws_sts_prompt_info)"

  [ -n "$aws" ] && echo "${magenta}aws:${norm}$aws"
  [ -n "$aws_source" ] && echo "${magenta}aws:${norm}$aws_source"
  [ -n "$sts" ] && echo "${magenta}sts:${norm}$sts"
}

__setup
