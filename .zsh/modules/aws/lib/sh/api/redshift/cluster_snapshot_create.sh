aws_redshift_cluster_snapshot_create() {
    local snapshot_identifier="$1"
    local cluster_identifier="$2"
    shift 2

    cond_log_and_run aws redshift create-cluster-snapshot --snapshot-identifier $snapshot_identifier --cluster-identifier $cluster_identifier "$@"
}
