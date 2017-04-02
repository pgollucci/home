aws_elb_security_groups_to_load_balancer_apply() {
    local load-balancer-name="$1"
    local security-groups="$2"
    shift 2

    cond_log_and_run aws elb  --load-balancer-name $load_balancer_name --security-groups $security_groups "@"

}
