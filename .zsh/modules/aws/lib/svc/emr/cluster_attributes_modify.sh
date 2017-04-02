aws_emr_cluster_attributes_modify() {
    local cluster-id="$1"
    shift 1

    cond_log_and_run aws emr  --cluster-id $cluster_id "@"

}
