aws_ec2_reserved_instances_offering_purchase() {
    local reserved_instances_offering_id="$1"
    local instance_count="$2"
    shift 2

    cond_log_and_run aws ec2 purchase-reserved-instances-offering --reserved-instances-offering-id $reserved_instances_offering_id --instance-count $instance_count "$@"
}
