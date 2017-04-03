aws_autoscaling_load_balancer_target_groups_attach() {
    local auto_scaling_group_name="$1"
    local target_group_arns="$2"
    shift 2

    log_and_run aws autoscaling attach-load-balancer-target-groups --auto-scaling-group-name $auto_scaling_group_name --target-group-arns $target_group_arns "$@"
}
