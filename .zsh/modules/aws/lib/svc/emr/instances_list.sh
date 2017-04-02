aws_emr_instances_list() {
    local cluster-id="$1"
    shift 1

    log_and_run aws emr  --cluster-id $cluster_id "@"

}
