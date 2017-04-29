aws_opsworks_cm_server_restore() {
    local backup_id="$1"
    local server_name="$2"
    shift 2

    cond_log_and_run aws opsworks-cm restore-server --backup-id $backup_id --server-name $server_name "$@"
}
