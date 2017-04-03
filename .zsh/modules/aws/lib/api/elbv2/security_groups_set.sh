aws_elbv2_security_groups_set() {
    local load_balancer_arn="$1"
    local security_groups="$2"
    shift 2

    cond_log_and_run aws elbv2 set-security-groups --load-balancer-arn $load_balancer_arn --security-groups $security_groups "$@"
}
