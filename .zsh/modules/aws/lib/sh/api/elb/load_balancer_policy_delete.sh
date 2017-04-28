aws_elb_load_balancer_policy_delete() {
    local load_balancer_name="$1"
    local policy_name="$2"
    shift 2

    cond_log_and_run aws elb delete-load-balancer-policy --load-balancer-name $load_balancer_name --policy-name $policy_name "$@"
}
