aws_efs_mount_target_create() {
    local subnet-id="$1"
    local file-system-id="$2"
    shift 2

    log_and_run aws efs  --subnet-id $subnet_id --file-system-id $file_system_id "@"

}
