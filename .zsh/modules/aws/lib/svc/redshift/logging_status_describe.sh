aws_redshift_logging_status_describe() {
    local cluster-identifier="$1"
    shift 1

    log_and_run aws redshift  --cluster-identifier $cluster_identifier "@"

}
