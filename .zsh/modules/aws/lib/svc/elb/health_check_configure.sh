aws_elb_health_check_configure() {
    local health-check="$1"
    local load-balancer-name="$2"
    shift 2

    cond_log_and_run aws elb  --health-check $health_check --load-balancer-name $load_balancer_name "@"

}
