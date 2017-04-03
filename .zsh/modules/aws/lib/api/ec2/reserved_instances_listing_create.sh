aws_ec2_reserved_instances_listing_create() {
    local reserved_instances_id="$1"
    local instance_count="$2"
    local price_schedules="$3"
    local client_token="$4"
    shift 4

    log_and_run aws ec2 create-reserved-instances-listing --reserved-instances-id $reserved_instances_id --instance-count $instance_count --price-schedules $price_schedules --client-token $client_token "$@"
}
