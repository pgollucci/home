aws_elbv2_subnets_set() {
    local subnets="$1"
    local load-balancer-arn="$2"
    shift 2

    cond_log_and_run aws elbv2  --subnets $subnets --load-balancer-arn $load_balancer_arn "@"

}
