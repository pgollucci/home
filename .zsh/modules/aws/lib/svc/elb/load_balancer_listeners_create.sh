aws_elb_load_balancer_listeners_create() {
    local load-balancer-name="$1"
    local listeners="$2"
    shift 2

    log_and_run aws elb  --load-balancer-name $load_balancer_name --listeners $listeners "@"

}
