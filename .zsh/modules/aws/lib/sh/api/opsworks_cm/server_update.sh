aws_opsworks_cm_server_update() {
    local server_name="$1"
    shift 1

    cond_log_and_run aws opsworks-cm update-server --server-name $server_name "$@"
}
