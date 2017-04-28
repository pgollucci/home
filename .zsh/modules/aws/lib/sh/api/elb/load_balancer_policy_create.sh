aws_elb_load_balancer_policy_create() {
    local load_balancer_name="$1"
    local policy_name="$2"
    local policy_type_name="$3"
    shift 3

    cond_log_and_run aws elb create-load-balancer-policy --load-balancer-name $load_balancer_name --policy-name $policy_name --policy-type-name $policy_type_name "$@"
}
