aws_ec2_snapshot_import() {
    shift 0

    cond_log_and_run aws ec2 import-snapshot "$@"
}
