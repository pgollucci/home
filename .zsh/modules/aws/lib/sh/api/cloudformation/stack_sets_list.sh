aws_cloudformation_stack_sets_list() {

    log_and_run aws cloudformation list-stack-sets "$@"
}
