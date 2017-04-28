aws_redshift_snapshot_copy_retention_period_modify() {
    local cluster_identifier="$1"
    local retention_period="$2"
    shift 2

    cond_log_and_run aws redshift modify-snapshot-copy-retention-period --cluster-identifier $cluster_identifier --retention-period $retention_period "$@"
}
