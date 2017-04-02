aws_autoscaling_instances_detach() {
    local auto-scaling-group-name="$1"
    local should-decrement-desired-capacity="$2"
    shift 2

    cond_log_and_run aws autoscaling  --auto-scaling-group-name $auto_scaling_group_name --should-decrement-desired-capacity $should_decrement_desired_capacity "@"

}
