aws_autoscaling_standby_enter() {
    local should-decrement-desired-capacity="$1"
    local auto-scaling-group-name="$2"
    shift 2

    cond_log_and_run aws autoscaling  --should-decrement-desired-capacity $should_decrement_desired_capacity --auto-scaling-group-name $auto_scaling_group_name "@"

}
