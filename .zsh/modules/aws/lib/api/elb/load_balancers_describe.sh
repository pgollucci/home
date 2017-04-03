aws_elb_load_balancers_describe() {
    shift 0

    log_and_run aws elb describe-load-balancers "$@"
}
