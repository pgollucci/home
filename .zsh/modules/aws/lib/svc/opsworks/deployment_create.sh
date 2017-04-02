aws_opsworks_deployment_create() {
    local command="$1"
    local stack-id="$2"
    shift 2

    cond_log_and_run aws opsworks  --command $command --stack-id $stack_id "@"

}
