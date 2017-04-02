aws_autoscaling_instance_in_auto_scaling_group_terminate() {
    local should-decrement-desired-capacity="$1"
    local instance-id="$2"
    shift 2

    cond_log_and_run aws autoscaling  --should-decrement-desired-capacity $should_decrement_desired_capacity --instance-id $instance_id "@"

}
