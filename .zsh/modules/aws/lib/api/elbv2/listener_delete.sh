aws_elbv2_listener_delete() {
    local listener_arn="$1"
    shift 1

    log_and_run aws elbv2 delete-listener --listener-arn $listener_arn "$@"
}
