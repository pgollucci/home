aws_cloudformation_change_set_create() {
    local stack_name="$1"
    local change_set_name="$2"
    shift 2

    cond_log_and_run aws cloudformation create-change-set --stack-name $stack_name --change-set-name $change_set_name "$@"
}
