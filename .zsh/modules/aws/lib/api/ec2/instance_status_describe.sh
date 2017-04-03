aws_ec2_instance_status_describe() {
    shift 0

    log_and_run aws ec2 describe-instance-status "$@"
}
