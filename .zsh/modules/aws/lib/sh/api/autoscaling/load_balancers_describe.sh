aws_autoscaling_load_balancers_describe() {
    local auto_scaling_group_name="$1"
    shift 1

    log_and_run aws autoscaling describe-load-balancers --auto-scaling-group-name $auto_scaling_group_name "$@"
}
