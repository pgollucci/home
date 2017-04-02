aws_autoscaling_instances_attach() {
    local auto-scaling-group-name="$1"
    shift 1

    cond_log_and_run aws autoscaling  --auto-scaling-group-name $auto_scaling_group_name "@"

}
