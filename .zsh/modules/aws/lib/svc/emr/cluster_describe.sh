aws_emr_cluster_describe() {
    local cluster-id="$1"
    shift 1

    log_and_run aws emr  --cluster-id $cluster_id "@"

}
