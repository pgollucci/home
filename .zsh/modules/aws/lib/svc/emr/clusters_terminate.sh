aws_emr_clusters_terminate() {
    local cluster-ids="$1"
    shift 1

    cond_log_and_run aws emr  --cluster-ids $cluster_ids "@"

}
