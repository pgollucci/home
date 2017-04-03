aws_waf_size_constraint_set_create() {
    local name="$1"
    local change_token="$2"
    shift 2

    cond_log_and_run aws waf create-size-constraint-set --name $name --change-token $change_token "$@"
}
