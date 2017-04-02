aws_emr_steps_add() {
    local steps="$1"
    local cluster-id="$2"
    shift 2

    cond_log_and_run aws emr  --steps $steps --cluster-id $cluster_id "@"

}
