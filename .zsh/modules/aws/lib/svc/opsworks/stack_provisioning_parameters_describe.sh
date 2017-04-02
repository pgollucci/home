aws_opsworks_stack_provisioning_parameters_describe() {
    local stack-id="$1"
    shift 1

    log_and_run aws opsworks  --stack-id $stack_id "@"

}
