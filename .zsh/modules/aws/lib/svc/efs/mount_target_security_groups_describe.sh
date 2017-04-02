aws_efs_mount_target_security_groups_describe() {
    local mount-target-id="$1"
    shift 1

    log_and_run aws efs  --mount-target-id $mount_target_id "@"

}
