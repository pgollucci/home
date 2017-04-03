aws_elb_load_balancer_create() {
    local load_balancer_name="$1"
    local listeners="$2"
    shift 2

    cond_log_and_run aws elb create-load-balancer --load-balancer-name $load_balancer_name --listeners $listeners "$@"
}
