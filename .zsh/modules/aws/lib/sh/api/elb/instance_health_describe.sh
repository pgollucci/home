aws_elb_instance_health_describe() {
    local load_balancer_name="$1"
    shift 1

    log_and_run aws elb describe-instance-health --load-balancer-name $load_balancer_name "$@"
}
