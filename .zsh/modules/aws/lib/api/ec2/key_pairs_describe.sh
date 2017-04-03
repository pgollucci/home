aws_ec2_key_pairs_describe() {
    shift 0

    log_and_run aws ec2 describe-key-pairs "$@"
}
