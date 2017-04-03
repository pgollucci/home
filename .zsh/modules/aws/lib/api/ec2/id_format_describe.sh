aws_ec2_id_format_describe() {
    shift 0

    log_and_run aws ec2 describe-id-format "$@"
}
