aws_opsworks_time_based_auto_scaling_set() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws opsworks set-time-based-auto-scaling --instance-id $instance_id "$@"
}
