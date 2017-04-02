aws_opsworks-cm_server_update() {
    local server-name="$1"
    shift 1

    cond_log_and_run aws opsworks-cm  --server-name $server_name "@"

}
