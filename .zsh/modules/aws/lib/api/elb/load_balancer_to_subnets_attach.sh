aws_elb_load_balancer_to_subnets_attach() {
    local load_balancer_name="$1"
    local subnets="$2"
    shift 2

    cond_log_and_run aws elb attach-load-balancer-to-subnets --load-balancer-name $load_balancer_name --subnets $subnets "$@"
}
