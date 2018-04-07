aws_cloudformation_stack_instances_create() {
    local stack_set_name="$1"
    local accounts="$2"
    local regions="$3"
    shift 3

    cond_log_and_run aws cloudformation create-stack-instances --stack-set-name $stack_set_name --accounts $accounts --regions $regions "$@"
}
