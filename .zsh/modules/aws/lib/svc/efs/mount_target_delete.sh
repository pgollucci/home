aws_efs_mount_target_delete() {
    local mount-target-id="$1"
    shift 1

    log_and_run aws efs  --mount-target-id $mount_target_id "@"

}
