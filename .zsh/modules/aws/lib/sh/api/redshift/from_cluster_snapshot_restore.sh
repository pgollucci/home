aws_redshift_from_cluster_snapshot_restore() {
    local cluster_identifier="$1"
    local snapshot_identifier="$2"
    shift 2

    cond_log_and_run aws redshift restore-from-cluster-snapshot --cluster-identifier $cluster_identifier --snapshot-identifier $snapshot_identifier "$@"
}
