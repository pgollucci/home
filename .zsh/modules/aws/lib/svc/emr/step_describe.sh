aws_emr_step_describe() {
    local step-id="$1"
    local cluster-id="$2"
    shift 2

    log_and_run aws emr  --step-id $step_id --cluster-id $cluster_id "@"

}
