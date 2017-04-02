aws_elb_app_cookie_stickiness_policy_create() {
    local cookie-name="$1"
    local policy-name="$2"
    local load-balancer-name="$3"
    shift 3

    cond_log_and_run aws elb  --cookie-name $cookie_name --policy-name $policy_name --load-balancer-name $load_balancer_name "@"

}
