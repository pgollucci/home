aws_autoscaling_standby_exit() {
    local auto_scaling_group_name="$1"
    shift 1

    cond_log_and_run aws autoscaling exit-standby --auto-scaling-group-name $auto_scaling_group_name "$@"
}
