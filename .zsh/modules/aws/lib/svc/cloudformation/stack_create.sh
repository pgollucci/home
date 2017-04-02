aws_cloudformation_stack_create() {
    local stack-name="$1"
    shift 1

    cond_log_and_run aws cloudformation  --stack-name $stack_name "@"

}
