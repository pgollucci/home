aws_redshift_logging_disable() {
    local cluster_identifier="$1"
    shift 1

    cond_log_and_run aws redshift disable-logging --cluster-identifier $cluster_identifier "$@"
}
