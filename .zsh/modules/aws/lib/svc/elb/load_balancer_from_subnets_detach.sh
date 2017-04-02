aws_elb_load_balancer_from_subnets_detach() {
    local load-balancer-name="$1"
    local subnets="$2"
    shift 2

    cond_log_and_run aws elb  --load-balancer-name $load_balancer_name --subnets $subnets "@"

}
