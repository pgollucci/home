aws_autoscaling_load_balancers_detach() {
    local auto_scaling_group_name="$1"
    local load_balancer_names="$2"
    shift 2

    cond_log_and_run aws autoscaling detach-load-balancers --auto-scaling-group-name $auto_scaling_group_name --load-balancer-names $load_balancer_names "$@"
}
