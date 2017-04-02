aws_redshift_cluster_snapshot_create() {
    local cluster-identifier="$1"
    local snapshot-identifier="$2"
    shift 2

    cond_log_and_run aws redshift  --cluster-identifier $cluster_identifier --snapshot-identifier $snapshot_identifier "@"

}
