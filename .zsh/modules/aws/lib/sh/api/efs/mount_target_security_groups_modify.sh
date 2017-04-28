aws_efs_mount_target_security_groups_modify() {
    local mount_target_id="$1"
    shift 1

    log_and_run aws efs modify-mount-target-security-groups --mount-target-id $mount_target_id "$@"
}
