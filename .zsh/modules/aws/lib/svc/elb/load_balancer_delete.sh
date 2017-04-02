aws_elb_load_balancer_delete() {
    local load-balancer-name="$1"
    shift 1

    cond_log_and_run aws elb  --load-balancer-name $load_balancer_name "@"

}
