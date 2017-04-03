aws_ec2_egress_only_internet_gateways_describe() {
    shift 0

    log_and_run aws ec2 describe-egress-only-internet-gateways "$@"
}
