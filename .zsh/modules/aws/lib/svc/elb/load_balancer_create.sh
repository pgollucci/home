aws_elb_load_balancer_create() {
    local listeners="$1"
    local load-balancer-name="$2"
    shift 2

    cond_log_and_run aws elb  --listeners $listeners --load-balancer-name $load_balancer_name "@"

}
