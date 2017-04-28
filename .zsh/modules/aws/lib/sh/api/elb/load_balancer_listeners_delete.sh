aws_elb_load_balancer_listeners_delete() {
    local load_balancer_name="$1"
    local load_balancer_ports="$2"
    shift 2

    log_and_run aws elb delete-load-balancer-listeners --load-balancer-name $load_balancer_name --load-balancer-ports $load_balancer_ports "$@"
}
