aws_snowball_cluster_describe() {
    local cluster_id="$1"
    shift 1

    log_and_run aws snowball describe-cluster --cluster-id $cluster_id "$@"
}
