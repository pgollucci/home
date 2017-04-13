aws_ec2_snapshot_import() {

    cond_log_and_run aws ec2 import-snapshot "$@"
}
