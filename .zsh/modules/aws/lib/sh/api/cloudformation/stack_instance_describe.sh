aws_cloudformation_stack_instance_describe() {
    local stack_set_name="$1"
    local stack_instance_account="$2"
    local stack_instance_region="$3"
    shift 3

    log_and_run aws cloudformation describe-stack-instance --stack-set-name $stack_set_name --stack-instance-account $stack_instance_account --stack-instance-region $stack_instance_region "$@"
}
