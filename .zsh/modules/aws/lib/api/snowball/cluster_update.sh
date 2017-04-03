aws_snowball_cluster_update() {
    local cluster_id="$1"
    shift 1

    cond_log_and_run aws snowball update-cluster --cluster-id $cluster_id "$@"
}
