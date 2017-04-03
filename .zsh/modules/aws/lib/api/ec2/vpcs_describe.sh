aws_ec2_vpcs_describe() {
    shift 0

    log_and_run aws ec2 describe-vpcs "$@"
}
