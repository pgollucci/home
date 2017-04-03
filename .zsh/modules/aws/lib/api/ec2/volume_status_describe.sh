aws_ec2_volume_status_describe() {
    shift 0

    log_and_run aws ec2 describe-volume-status "$@"
}
