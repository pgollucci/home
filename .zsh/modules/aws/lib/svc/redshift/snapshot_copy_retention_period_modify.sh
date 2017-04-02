aws_redshift_snapshot_copy_retention_period_modify() {
    local retention-period="$1"
    local cluster-identifier="$2"
    shift 2

    cond_log_and_run aws redshift  --retention-period $retention_period --cluster-identifier $cluster_identifier "@"

}
