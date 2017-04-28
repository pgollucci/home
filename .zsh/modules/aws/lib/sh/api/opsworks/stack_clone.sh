aws_opsworks_stack_clone() {
    local source_stack_id="$1"
    local service_role_arn="$2"
    shift 2

    cond_log_and_run aws opsworks clone-stack --source-stack-id $source_stack_id --service-role-arn $service_role_arn "$@"
}
