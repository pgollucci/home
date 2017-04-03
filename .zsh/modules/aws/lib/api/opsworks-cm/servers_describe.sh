aws_opsworks-cm_servers_describe() {
    shift 0

    log_and_run aws opsworks-cm describe-servers "$@"
}
