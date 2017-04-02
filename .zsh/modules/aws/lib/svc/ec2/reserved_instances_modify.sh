aws_ec2_reserved_instances_modify() {
    local target-configurations="$1"
    local reserved-instances-ids="$2"
    shift 2

    cond_log_and_run aws ec2  --target-configurations $target_configurations --reserved-instances-ids $reserved_instances_ids "@"

}
