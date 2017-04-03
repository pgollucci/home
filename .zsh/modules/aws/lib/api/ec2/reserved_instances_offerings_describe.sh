aws_ec2_reserved_instances_offerings_describe() {
    shift 0

    log_and_run aws ec2 describe-reserved-instances-offerings "$@"
}
