aws_autoscaling_load_balancers_attach() {
    local auto_scaling_group_name="$1"
    local load_balancer_names="$2"
    shift 2

    cond_log_and_run aws autoscaling attach-load-balancers --auto-scaling-group-name $auto_scaling_group_name --load-balancer-names $load_balancer_names "$@"
}
