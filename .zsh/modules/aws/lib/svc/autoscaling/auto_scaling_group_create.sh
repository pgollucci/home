aws_autoscaling_auto_scaling_group_create() {
    local auto-scaling-group-name="$1"
    local max-size="$2"
    local min-size="$3"
    shift 3

    cond_log_and_run aws autoscaling  --auto-scaling-group-name $auto_scaling_group_name --max-size $max_size --min-size $min_size "@"

}
