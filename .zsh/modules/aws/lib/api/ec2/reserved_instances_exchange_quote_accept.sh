aws_ec2_reserved_instances_exchange_quote_accept() {
    local reserved_instance_ids="$1"
    shift 1

    cond_log_and_run aws ec2 accept-reserved-instances-exchange-quote --reserved-instance-ids $reserved_instance_ids "$@"
}
