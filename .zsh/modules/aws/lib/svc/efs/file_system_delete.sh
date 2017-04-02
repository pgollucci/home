aws_efs_file_system_delete() {
    local file-system-id="$1"
    shift 1

    cond_log_and_run aws efs  --file-system-id $file_system_id "@"

}
