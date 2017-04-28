aws_autoscaling_instance_in_auto_scaling_group_terminate() {
    local instance_id="$1"
    local should_decrement_desired_capacity="$2"
    shift 2

    cond_log_and_run aws autoscaling terminate-instance-in-auto-scaling-group --instance-id $instance_id --should-decrement-desired-capacity $should_decrement_desired_capacity "$@"
}
