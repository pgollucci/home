aws_autoscaling_instance_health_set() {
    local instance_id="$1"
    local health_status="$2"
    shift 2

    cond_log_and_run aws autoscaling set-instance-health --instance-id $instance_id --health-status $health_status "$@"
}
