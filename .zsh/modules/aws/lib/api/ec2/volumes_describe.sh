aws_ec2_volumes_describe() {
    shift 0

    log_and_run aws ec2 describe-volumes "$@"
}
