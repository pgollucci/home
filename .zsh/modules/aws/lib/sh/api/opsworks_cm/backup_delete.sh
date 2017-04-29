aws_opsworks_cm_backup_delete() {
    local backup_id="$1"
    shift 1

    cond_log_and_run aws opsworks-cm delete-backup --backup-id $backup_id "$@"
}
