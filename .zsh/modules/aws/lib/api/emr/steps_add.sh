aws_emr_steps_add() {
    local cluster_id="$1"
    local steps="$2"
    shift 2

    cond_log_and_run aws emr add-steps --cluster-id $cluster_id --steps $steps "$@"
}
