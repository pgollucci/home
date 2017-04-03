aws_opsworks_elastic_ips_describe() {
    shift 0

    log_and_run aws opsworks describe-elastic-ips "$@"
}
