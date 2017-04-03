aws_efs_mount_targets_describe() {
    shift 0

    log_and_run aws efs describe-mount-targets "$@"
}
