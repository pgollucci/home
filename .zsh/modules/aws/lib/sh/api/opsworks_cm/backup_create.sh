aws_opsworks_cm_backup_create() {
    local server_name="$1"
    shift 1

    cond_log_and_run aws opsworks-cm create-backup --server-name $server_name "$@"
}
