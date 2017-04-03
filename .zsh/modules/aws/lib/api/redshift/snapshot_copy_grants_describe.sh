aws_redshift_snapshot_copy_grants_describe() {
    shift 0

    log_and_run aws redshift describe-snapshot-copy-grants "$@"
}
