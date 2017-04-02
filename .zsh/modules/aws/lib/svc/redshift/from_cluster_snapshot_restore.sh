aws_redshift_from_cluster_snapshot_restore() {
    local cluster-identifier="$1"
    local snapshot-identifier="$2"
    shift 2

    cond_log_and_run aws redshift  --cluster-identifier $cluster_identifier --snapshot-identifier $snapshot_identifier "@"

}
