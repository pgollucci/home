aws_redshift_logging_status_describe() {
    local cluster_identifier="$1"
    shift 1

    log_and_run aws redshift describe-logging-status --cluster-identifier $cluster_identifier "$@"
}
