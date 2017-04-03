aws_emr_clusters_terminate() {
    local cluster_ids="$1"
    shift 1

    cond_log_and_run aws emr terminate-clusters --cluster-ids $cluster_ids "$@"
}
