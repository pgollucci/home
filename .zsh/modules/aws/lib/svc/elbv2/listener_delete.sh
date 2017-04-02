aws_elbv2_listener_delete() {
    local listener-arn="$1"
    shift 1

    log_and_run aws elbv2  --listener-arn $listener_arn "@"

}
