aws_autoscaling_desired_capacity_set() {
    local auto_scaling_group_name="$1"
    local desired_capacity="$2"
    shift 2

    cond_log_and_run aws autoscaling set-desired-capacity --auto-scaling-group-name $auto_scaling_group_name --desired-capacity $desired_capacity "$@"
}
