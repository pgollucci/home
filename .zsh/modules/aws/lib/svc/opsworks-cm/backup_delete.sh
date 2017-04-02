aws_opsworks-cm_backup_delete() {
    local backup-id="$1"
    shift 1

    cond_log_and_run aws opsworks-cm  --backup-id $backup_id "@"

}
