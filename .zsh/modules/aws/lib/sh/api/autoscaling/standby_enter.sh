aws_autoscaling_standby_enter() {
    local auto_scaling_group_name="$1"
    local should_decrement_desired_capacity="$2"
    shift 2

    cond_log_and_run aws autoscaling enter-standby --auto-scaling-group-name $auto_scaling_group_name --should-decrement-desired-capacity $should_decrement_desired_capacity "$@"
}
