aws_opsworks-cm_server_restore() {
    local backup-id="$1"
    local server-name="$2"
    shift 2

    cond_log_and_run aws opsworks-cm  --backup-id $backup_id --server-name $server_name "@"

}
