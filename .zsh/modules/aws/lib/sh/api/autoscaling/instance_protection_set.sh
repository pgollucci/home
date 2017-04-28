aws_autoscaling_instance_protection_set() {
    local instance_ids="$1"
    local auto_scaling_group_name="$2"
    local protected_from_scale_in="$3"
    shift 3

    cond_log_and_run aws autoscaling set-instance-protection --instance-ids $instance_ids --auto-scaling-group-name $auto_scaling_group_name --protected-from-scale-in $protected_from_scale_in "$@"
}
