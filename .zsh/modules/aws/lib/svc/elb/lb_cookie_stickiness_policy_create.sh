aws_elb_lb_cookie_stickiness_policy_create() {
    local policy-name="$1"
    local load-balancer-name="$2"
    shift 2

    cond_log_and_run aws elb  --policy-name $policy_name --load-balancer-name $load_balancer_name "@"

}
