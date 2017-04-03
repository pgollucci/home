aws_emr_step_describe() {
    local cluster_id="$1"
    local step_id="$2"
    shift 2

    log_and_run aws emr describe-step --cluster-id $cluster_id --step-id $step_id "$@"
}
