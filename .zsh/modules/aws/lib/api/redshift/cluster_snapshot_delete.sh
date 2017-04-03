aws_redshift_cluster_snapshot_delete() {
    local snapshot_identifier="$1"
    shift 1

    cond_log_and_run aws redshift delete-cluster-snapshot --snapshot-identifier $snapshot_identifier "$@"
}
