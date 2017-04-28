aws_opsworks_time_based_auto_scaling_describe() {
    local instance_ids="$1"
    shift 1

    log_and_run aws opsworks describe-time-based-auto-scaling --instance-ids $instance_ids "$@"
}
