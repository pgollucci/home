aws_cloudformation_change_sets_list() {
    local stack_name="$1"
    shift 1

    log_and_run aws cloudformation list-change-sets --stack-name $stack_name "$@"
}
