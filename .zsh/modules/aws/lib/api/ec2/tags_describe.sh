aws_ec2_tags_describe() {
    shift 0

    log_and_run aws ec2 describe-tags "$@"
}
