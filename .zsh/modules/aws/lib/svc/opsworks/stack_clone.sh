aws_opsworks_stack_clone() {
    local source-stack-id="$1"
    local service-role-arn="$2"
    shift 2

    cond_log_and_run aws opsworks  --source-stack-id $source_stack_id --service-role-arn $service_role_arn "@"

}
