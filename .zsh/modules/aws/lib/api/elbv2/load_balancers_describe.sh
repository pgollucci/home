aws_elbv2_load_balancers_describe() {
    shift 0

    log_and_run aws elbv2 describe-load-balancers "$@"
}
