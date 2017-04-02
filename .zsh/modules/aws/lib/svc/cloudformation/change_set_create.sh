aws_cloudformation_change_set_create() {
    local change-set-name="$1"
    local stack-name="$2"
    shift 2

    cond_log_and_run aws cloudformation  --change-set-name $change_set_name --stack-name $stack_name "@"

}
