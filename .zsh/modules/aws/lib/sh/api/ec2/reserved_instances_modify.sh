aws_ec2_reserved_instances_modify() {
    local reserved_instances_ids="$1"
    local target_configurations="$2"
    shift 2

    cond_log_and_run aws ec2 modify-reserved-instances --reserved-instances-ids $reserved_instances_ids --target-configurations $target_configurations "$@"
}
