aws_efs_mount_target_delete() {
    local mount_target_id="$1"
    shift 1

    log_and_run aws efs delete-mount-target --mount-target-id $mount_target_id "$@"
}
