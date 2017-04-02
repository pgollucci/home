aws_opsworks_time_based_auto_scaling_set() {
    local instance-id="$1"
    shift 1

    cond_log_and_run aws opsworks  --instance-id $instance_id "@"

}
