aws_elb_availability_zones_for_load_balancer_disable() {
    local availability-zones="$1"
    local load-balancer-name="$2"
    shift 2

    cond_log_and_run aws elb  --availability-zones $availability_zones --load-balancer-name $load_balancer_name "@"

}
