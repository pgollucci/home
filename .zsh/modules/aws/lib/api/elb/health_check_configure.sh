aws_elb_health_check_configure() {
    local load_balancer_name="$1"
    local health_check="$2"
    shift 2

    cond_log_and_run aws elb configure-health-check --load-balancer-name $load_balancer_name --health-check $health_check "$@"
}
