aws_redshift_snapshot_copy_disable() {
    local cluster-identifier="$1"
    shift 1

    cond_log_and_run aws redshift  --cluster-identifier $cluster_identifier "@"

}
