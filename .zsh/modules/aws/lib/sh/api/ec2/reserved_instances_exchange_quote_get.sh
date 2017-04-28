aws_ec2_reserved_instances_exchange_quote_get() {
    local reserved_instance_ids="$1"
    shift 1

    log_and_run aws ec2 get-reserved-instances-exchange-quote --reserved-instance-ids $reserved_instance_ids "$@"
}
