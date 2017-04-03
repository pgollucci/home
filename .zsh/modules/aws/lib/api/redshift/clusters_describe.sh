aws_redshift_clusters_describe() {
    shift 0

    log_and_run aws redshift describe-clusters "$@"
}
