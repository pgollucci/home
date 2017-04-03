aws_elb_security_groups_to_load_balancer_apply() {
    local load_balancer_name="$1"
    local security_groups="$2"
    shift 2

    cond_log_and_run aws elb apply-security-groups-to-load-balancer --load-balancer-name $load_balancer_name --security-groups $security_groups "$@"
}
