aws_redshift_snapshot_copy_enable() {
    local destination-region="$1"
    local cluster-identifier="$2"
    shift 2

    cond_log_and_run aws redshift  --destination-region $destination_region --cluster-identifier $cluster_identifier "@"

}
