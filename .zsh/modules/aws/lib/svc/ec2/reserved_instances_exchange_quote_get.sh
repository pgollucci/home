aws_ec2_reserved_instances_exchange_quote_get() {
    local reserved-instance-ids="$1"
    shift 1

    log_and_run aws ec2  --reserved-instance-ids $reserved_instance_ids "@"

}
