aws_elb_availability_zones_for_load_balancer_disable() {
    local load_balancer_name="$1"
    local availability_zones="$2"
    shift 2

    cond_log_and_run aws elb disable-availability-zones-for-load-balancer --load-balancer-name $load_balancer_name --availability-zones $availability_zones "$@"
}
