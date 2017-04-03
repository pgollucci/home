aws_opsworks_elastic_load_balancers_describe() {
    shift 0

    log_and_run aws opsworks describe-elastic-load-balancers "$@"
}
