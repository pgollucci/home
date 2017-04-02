aws_redshift_cluster_reboot() {
    local cluster-identifier="$1"
    shift 1

    cond_log_and_run aws redshift  --cluster-identifier $cluster_identifier "@"

}
