aws_efs_mount_target_create() {
    local file_system_id="$1"
    local subnet_id="$2"
    shift 2

    log_and_run aws efs create-mount-target --file-system-id $file_system_id --subnet-id $subnet_id "$@"
}
