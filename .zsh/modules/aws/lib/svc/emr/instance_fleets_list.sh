aws_emr_instance_fleets_list() {
    local cluster-id="$1"
    shift 1

    log_and_run aws emr  --cluster-id $cluster_id "@"

}
