aws_ec2_prefix_lists_describe() {
    shift 0

    log_and_run aws ec2 describe-prefix-lists "$@"
}
