aws_emr_steps_list() {
    local cluster_id="$1"
    shift 1

    log_and_run aws emr list-steps --cluster-id $cluster_id "$@"
}
