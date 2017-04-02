aws_autoscaling_instance_health_set() {
    local health-status="$1"
    local instance-id="$2"
    shift 2

    cond_log_and_run aws autoscaling  --health-status $health_status --instance-id $instance_id "@"

}
