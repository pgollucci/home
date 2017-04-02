aws_elb_load_balancer_policy_delete() {
    local policy-name="$1"
    local load-balancer-name="$2"
    shift 2

    cond_log_and_run aws elb  --policy-name $policy_name --load-balancer-name $load_balancer_name "@"

}
