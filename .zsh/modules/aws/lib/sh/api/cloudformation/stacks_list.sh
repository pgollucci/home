aws_cloudformation_stacks_list() {

    log_and_run aws cloudformation list-stacks "$@"
}
