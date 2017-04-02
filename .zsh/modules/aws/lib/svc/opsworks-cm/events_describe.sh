aws_opsworks-cm_events_describe() {
    local server-name="$1"
    shift 1

    log_and_run aws opsworks-cm  --server-name $server_name "@"

}
