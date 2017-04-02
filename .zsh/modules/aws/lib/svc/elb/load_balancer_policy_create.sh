aws_elb_load_balancer_policy_create() {
    local load-balancer-name="$1"
    local policy-type-name="$2"
    local policy-name="$3"
    shift 3

    cond_log_and_run aws elb  --load-balancer-name $load_balancer_name --policy-type-name $policy_type_name --policy-name $policy_name "@"

}
