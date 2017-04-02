aws_autoscaling_desired_capacity_set() {
    local auto-scaling-group-name="$1"
    local desired-capacity="$2"
    shift 2

    cond_log_and_run aws autoscaling  --auto-scaling-group-name $auto_scaling_group_name --desired-capacity $desired_capacity "@"

}
