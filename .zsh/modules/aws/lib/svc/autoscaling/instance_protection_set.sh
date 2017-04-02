aws_autoscaling_instance_protection_set() {
    local protected-from-scale-in="$1"
    local auto-scaling-group-name="$2"
    local instance-ids="$3"
    shift 3

    cond_log_and_run aws autoscaling  --protected-from-scale-in $protected_from_scale_in --auto-scaling-group-name $auto_scaling_group_name --instance-ids $instance_ids "@"

}
