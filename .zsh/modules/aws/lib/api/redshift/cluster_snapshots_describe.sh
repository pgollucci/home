aws_redshift_cluster_snapshots_describe() {
    shift 0

    log_and_run aws redshift describe-cluster-snapshots "$@"
}
