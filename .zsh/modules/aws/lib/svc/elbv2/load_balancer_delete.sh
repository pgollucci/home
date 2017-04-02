aws_elbv2_load_balancer_delete() {
    local load-balancer-arn="$1"
    shift 1

    cond_log_and_run aws elbv2  --load-balancer-arn $load_balancer_arn "@"

}
