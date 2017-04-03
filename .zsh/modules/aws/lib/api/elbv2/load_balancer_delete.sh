aws_elbv2_load_balancer_delete() {
    local load_balancer_arn="$1"
    shift 1

    cond_log_and_run aws elbv2 delete-load-balancer --load-balancer-arn $load_balancer_arn "$@"
}
