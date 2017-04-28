aws_opsworks-cm_events_describe() {
    local server_name="$1"
    shift 1

    log_and_run aws opsworks-cm describe-events --server-name $server_name "$@"
}
