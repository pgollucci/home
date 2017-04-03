aws_ec2_account_attributes_describe() {
    shift 0

    log_and_run aws ec2 describe-account-attributes "$@"
}
