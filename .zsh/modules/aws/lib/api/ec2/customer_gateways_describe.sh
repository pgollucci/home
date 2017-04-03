aws_ec2_customer_gateways_describe() {
    shift 0

    log_and_run aws ec2 describe-customer-gateways "$@"
}
