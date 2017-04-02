aws_ec2_reserved_instances_offering_purchase() {
    local instance-count="$1"
    local reserved-instances-offering-id="$2"
    shift 2

    cond_log_and_run aws ec2  --instance-count $instance_count --reserved-instances-offering-id $reserved_instances_offering_id "@"

}
