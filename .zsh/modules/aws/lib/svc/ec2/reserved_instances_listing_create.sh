aws_ec2_reserved_instances_listing_create() {
    local instance-count="$1"
    local reserved-instances-id="$2"
    local client-token="$3"
    local price-schedules="$4"
    shift 4

    log_and_run aws ec2  --instance-count $instance_count --reserved-instances-id $reserved_instances_id --client-token $client_token --price-schedules $price_schedules "@"

}
