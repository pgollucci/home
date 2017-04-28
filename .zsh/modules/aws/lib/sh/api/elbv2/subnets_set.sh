aws_elbv2_subnets_set() {
    local load_balancer_arn="$1"
    local subnets="$2"
    shift 2

    cond_log_and_run aws elbv2 set-subnets --load-balancer-arn $load_balancer_arn --subnets $subnets "$@"
}
