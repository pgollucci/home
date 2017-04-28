aws_elb_load_balancer_listeners_create() {
    local load_balancer_name="$1"
    local listeners="$2"
    shift 2

    log_and_run aws elb create-load-balancer-listeners --load-balancer-name $load_balancer_name --listeners $listeners "$@"
}
