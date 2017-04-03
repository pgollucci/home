aws_ec2_reserved_instances_listing_cancel() {
    local reserved_instances_listing_id="$1"
    shift 1

    log_and_run aws ec2 cancel-reserved-instances-listing --reserved-instances-listing-id $reserved_instances_listing_id "$@"
}
