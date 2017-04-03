aws_snowball_cluster_cancel() {
    local cluster_id="$1"
    shift 1

    cond_log_and_run aws snowball cancel-cluster --cluster-id $cluster_id "$@"
}
