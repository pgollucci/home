aws_ec2_reserved_instances_listing_create() {
    local client_token="$1"
    local instance_count="$2"
    local price_schedules="$3"
    local reserved_instances_id="$4"
    shift 4

    log_and_run aws ec2 create-reserved-instances-listing --client-token $client_token --instance-count $instance_count --price-schedules $price_schedules --reserved-instances-id $reserved_instances_id "$@"
}
