aws_autoscaling_instances_protected_from_scale_in() {
        local auto_scaling_group_name="$1"
        shift 1

    cond_log_and_run aws autoscaling update-auto-scaling-group --auto-scaling-group-name $auto_scaling_group_name --new-instances-protected-from-scale-in "$@"
}

