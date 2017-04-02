aws_cloudformation_stack_resources_list() {
    local stack-name="$1"
    shift 1

    log_and_run aws cloudformation  --stack-name $stack_name "@"

}
