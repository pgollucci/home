aws_autoscaling_load_balancer_target_groups_attach() {
    local auto-scaling-group-name="$1"
    local target-group-arns="$2"
    shift 2

    log_and_run aws autoscaling  --auto-scaling-group-name $auto_scaling_group_name --target-group-arns $target_group_arns "@"

}
